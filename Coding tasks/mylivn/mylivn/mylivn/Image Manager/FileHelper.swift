//
//  FileHelper.swift
//  mylivn
//
//  Created by atikhonov on 12.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation

class FileHelper {
    
    private let fileManager = FileManager.default
    
    lazy var avatarsURL: URL = {
        // "try!" is not good, but leave it as it is 
        let documentsURL = try! fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let directoryName = "avatars"
        let avatarsURL = documentsURL.appendingPathComponent(directoryName)
        return avatarsURL
    }()
    
    func moveFile(location: URL) throws -> URL {
        try createAvatarsDirectoryIfNeeded()
        let savedURL = try removeFileIfNeeded(fileName: location.lastPathComponent)
        try fileManager.moveItem(at: location, to: savedURL)
        return savedURL
    }
    
    func removeFileIfNeeded(fileName: String) throws -> URL {
        // destination saved URL
        let savedURL = avatarsURL.appendingPathComponent(fileName)
        
        // replace the file at saved URL
        let fileExist = fileManager.fileExists(atPath: savedURL.path)
        if fileExist {
            try fileManager.removeItem(at: savedURL)
        }
        return savedURL
    }
    
    func createAvatarsDirectoryIfNeeded() throws {
        // create "avatars" directory in documents if it's not exist
        var isDirectory = ObjCBool(true)
        let directoryExist = fileManager.fileExists(atPath: avatarsURL.path, isDirectory: &isDirectory)
        if directoryExist {
            // check if is it directory or not, if it's file to create directory in different path
        } else {
            try fileManager.createDirectory(at: avatarsURL, withIntermediateDirectories: true, attributes: nil)
        }
    }
}
