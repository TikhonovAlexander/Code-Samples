//
//  DownloadImageTask.swift
//  mylivn
//
//  Created by atikhonov on 09.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import UIKit

class DownloadImageTask {
    
    var url: URL
    var completion: ((Result<URL, Error>) -> Void)?
    var progress: ((Result<Float, Error>) -> Void)?
    var task: URLSessionTask?
    
    init(url: URL, progress: ((Result<Float, Error>) -> Void)? = nil, completion: ((Result<URL, Error>) -> Void)?) {
        self.url = url
        self.progress = progress
        self.completion = completion
    }
    
}
