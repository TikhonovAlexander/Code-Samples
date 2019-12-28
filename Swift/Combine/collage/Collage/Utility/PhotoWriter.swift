 
 
 import Foundation
 import UIKit
 import Photos
 
 import Combine
 
 class PhotoWriter {
    enum Error: Swift.Error {
        case couldNotSavePhoto
        case generic(Swift.Error)
    }
    
    static func save(_ image: UIImage) -> Future<String, PhotoWriter.Error> {
        return Future { resolve in
            do {
                try PHPhotoLibrary.shared().performChangesAndWait {
                    let request = PHAssetChangeRequest.creationRequestForAsset(from: image)
                    guard let savedAssetID = request.placeholderForCreatedAsset?.localIdentifier else {
                        return resolve(.failure(.couldNotSavePhoto))
                    }
                    resolve(.success(savedAssetID))
                }
            } catch {
                resolve(.failure(.generic(error)))
            }
        }
    }
 }
