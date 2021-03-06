//
//  DownloadImageOperation.swift
//  AsyncImages
//
//  Created by tikhonov on 11.04.20.
//  Copyright © 2020 tikhonov. All rights reserved.
//

import UIKit
import Combine

typealias ImageOperationCompletion = ((Data?, URLResponse?, Error?) -> Void)?

private var sessionManager: URLSession = {
    let configuration = URLSessionConfiguration.default
    configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
    let sessionManager = URLSession(configuration: configuration)
    return sessionManager
}()

class DownloadImageOperation: AsyncOperation, ImageProvider {
    
    private let url: URL
    private let completion: ImageOperationCompletion
    
    var image: UIImage?
    var task: URLSessionTask?
    
    init(url: URL, completion: ImageOperationCompletion = nil) {
        self.url = url
        self.completion = completion
        super.init()
    }
    
    override func main() {
        task = sessionManager.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            
            defer { self.state = .finished }
            guard !self.isCancelled else { return }
            
            if let completion = self.completion {
                completion(data, response, error)
                return
            }
            guard error == nil, let data = data else { return }
            self.image = UIImage(data: data)
        }
        task?.resume()
    }
    
    override func cancel() {
        super.cancel()
        task?.cancel()
    }
}
