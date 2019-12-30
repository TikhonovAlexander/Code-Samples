import UIKit
import Combine

var subscriptions = Set<AnyCancellable>()

let photoService = PhotoService()
example(of: "Catching and retrying") {
    photoService
        .fetchPhoto(quality: .high)
        .handleEvents( receiveSubscription: { _ in print("Trying ...") }, receiveCompletion: {
            guard case .failure(let error) = $0 else { return }
            print("Got error: \(error)")
        })
        .retry(3)
        .catch { error -> PhotoService.Publisher in
            print("Failed fetching high quality, falling back to low quality")
            return photoService.fetchPhoto(quality: .low)
        }
        .replaceError(with: UIImage(named: "na.jpg")!)
        .sink(
            receiveCompletion: { print("\($0)") },
            receiveValue: { image in
                image
                print("Got image: \(image)")
        }
    )
        .store(in: &subscriptions)
}
