//
//  mylivnTests.swift
//  mylivnTests
//
//  Created by atikhonov on 10.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import XCTest
@testable import mylivn

class imageDownloaderManagerTests: XCTestCase {
    
    var manager = ImageDownloaderManager()
    var links = Storage.links()
    var testingURL: URL {
        links[0]
    }
    
    override func setUp() {}
    
    override func tearDown() {}
    
    func testLoadImage() {
        let exp = expectation(description: "loading image")
        let url = testingURL
        manager.load(url) { result in
            switch result {
            case .success(let image):
                XCTAssertNotNil(image)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testProgressLoadImage() {
        let exp = expectation(description: "loading image")
        let url = testingURL
        var given: Float?
        manager.load(url, progress: { result in
            switch result {
            case .success(let progress):
                given = progress
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }, completion: { result in
            switch result {
            case .success(_):
                break
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
            exp.fulfill()
        })
        waitForExpectations(timeout: 5.0, handler: nil)
        let expected: Float = 1.0
        XCTAssertNotNil(given)
        if let given = given {
            print(given)
            XCTAssert(given == expected, "Progress wasn't finished")
        }
    }
    
    func testErrorsLoadImage() {
        let exp = expectation(description: "loading image")
        let url = URL(string: "https://www.google.com/")!
        
        manager.load(url, completion: { result in
            switch result {
            case .success(let image):
                XCTAssertNil(image)
            case .failure(_):
                break
            }
            exp.fulfill()
        })
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
}
