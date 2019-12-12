 import UIKit
 import Combine
 
 class MainViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var imagePreview: UIImageView! {
        didSet {
            imagePreview.layer.borderColor = UIColor.gray.cgColor
        }
    }
    @IBOutlet weak var buttonClear: UIButton!
    @IBOutlet weak var buttonSave: UIButton!
    @IBOutlet weak var itemAdd: UIBarButtonItem!
    
    // MARK: - Private properties
    
    private var subsriptions = Set<AnyCancellable>()
    private let images = CurrentValueSubject<[UIImage], Never>([])
    
    // MARK: - View controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let collageSize = imagePreview.frame.size
        images
            .handleEvents(receiveOutput: { photos in
                self.updateUI(photos: photos)
            })
            .map { photos in
                UIImage.collage(images: photos, size: collageSize)
        }
        .assign(to: \.image, on: imagePreview)
        .store(in: &subsriptions)
    }
    
    private func updateUI(photos: [UIImage]) {
        buttonSave.isEnabled = photos.count > 0 && photos.count % 2 == 0
        buttonClear.isEnabled = photos.count > 0
        itemAdd.isEnabled = photos.count < 6
        title = photos.count > 0 ? "\(photos.count) photos" : "Collage"
    }
    
    // MARK: - Actions
    
    @IBAction func actionClear() {
        images.send([])
    }
    
    @IBAction func actionSave() {
        guard let image = imagePreview.image else { return }
        PhotoWriter.save(image)
            .sink(receiveCompletion: { [unowned self] completion in
                if case .failure(let error) = completion {
                    self.showMessage("Error", description: error.localizedDescription)
                }
                self.actionClear()
                }, receiveValue: { [unowned self] id in
                    self.showMessage("Saved with id: \(id)") })
            .store(in: &subsriptions)
    }
    
    @IBAction func actionAdd() {
        //        let newImages = images.value + [UIImage(named: "IMG_1907.jpg")!]
        //        images.send(newImages)
        let photos = storyboard!.instantiateViewController(identifier: "PhotosViewController") as! PhotosViewController
        
        photos.$selectedPhotosCount
            .filter { $0 > 0 }
            .map { "Selected \($0) photos" }
            .assign(to: \.title, on: self)
            .store(in: &subsriptions)
            
        
        let newPhotos = photos.selectedPhotos
            .prefix(while: { [unowned self] _ in self.images.value.count < 6 })
            .share()
        newPhotos
            .map { newImage in
                self.images.value + [newImage]
        }
        .assign(to: \.value, on: images)
        .store(in: &subsriptions)
        
        newPhotos
            .ignoreOutput()
            .delay(for: 2.0, scheduler: DispatchQueue.main)
            .sink(receiveCompletion: { [unowned self] _ in
                self.updateUI(photos: self.images.value)
            }, receiveValue: { _ in } )
            .store(in: &subsriptions)
        navigationController?.pushViewController(photos, animated: true)
    }
    
    private func showMessage(_ title: String, description: String? = nil) {
        alert(title: title, text: description)
            .sink(receiveValue: {_ in })
            .store(in: &subsriptions)
    }
 }
