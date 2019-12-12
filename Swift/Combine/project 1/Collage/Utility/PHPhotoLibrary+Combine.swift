 
 
 import Foundation
 import Photos
 import Combine
 
 extension PHPhotoLibrary {
    static func fetchAuthorizationStatus(callback: @escaping (Bool) -> Void) {
        // Fetch the current status.
        let currentlyAuthorized = authorizationStatus() == .authorized
        
        // If authozied callback immediately.
        guard !currentlyAuthorized else {
            return callback(currentlyAuthorized)
        }
        
        // Otherwise request access and callback with the new status.
        requestAuthorization { newStatus in
            callback(newStatus == .authorized)
        }
    }
 }
 
