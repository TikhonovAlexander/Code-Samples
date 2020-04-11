//
//  ImageDownloaderManager.swift
//  mylivn
//
//  Created by atikhonov on 09.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation

class ImageDownloaderManager: NSObject {
    
    private var downloadImageTasks: [DownloadImageTask] = []
    private let fileHelper: FileHelper = FileHelper()
    
    private lazy var sessionManager: URLSession = {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let sessionManager = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        return sessionManager
    }()
    
    func load(_ url: URL, progress: ((Result<Float, Error>) -> Void)? = nil, completion: ((Result<URL, Error>) -> Void)? ) {
        let downloadImageTask = DownloadImageTask(url: url, progress: progress, completion: completion)
        let task = sessionManager.downloadTask(with: downloadImageTask.url)
        downloadImageTask.task = task
        downloadImageTasks.append(downloadImageTask)
        task.resume()
    }
    
}

extension ImageDownloaderManager: URLSessionDelegate {}

extension ImageDownloaderManager: URLSessionTaskDelegate {
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        guard let error = error else { return }
        let downloadImageTask = downloadImageTasks.first { downloadImageTask in
            downloadImageTask.task == task
        }
        guard let task = downloadImageTask else { return }
        let completion = task.completion
        completion?(.failure(error))
    }
}

extension ImageDownloaderManager: URLSessionDownloadDelegate {
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        let taskIndex = downloadImageTasks.firstIndex { downloadImageTask in
            downloadImageTask.task == downloadTask
        }
        guard let index = taskIndex else { return }
        let task = downloadImageTasks[index]
        downloadImageTasks.remove(at: index)
        let completion = task.completion
        
        if let error = downloadTask.error {
            completion?(.failure(ImageError.network(error: error)))
            return
        }
        guard let httpResponse = downloadTask.response as? HTTPURLResponse else {
            completion?(.failure(ImageError.response))
            return
        }
        let statusCode = httpResponse.statusCode
        guard statusCode == 200 else {
            completion?(.failure(ImageError.statusCode(code: statusCode)))
            return
        }
        
        do {
            let url = try fileHelper.moveFile(location: location)
            completion?(.success(url))
        } catch (let error) {
            completion?(.failure(error))
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let calculatedProgress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
        let downloadImageTask = downloadImageTasks.first { downloadImageTask in
            downloadImageTask.task == downloadTask
        }
        guard let task = downloadImageTask else { return }
        task.progress?(.success(calculatedProgress))
    }
}
