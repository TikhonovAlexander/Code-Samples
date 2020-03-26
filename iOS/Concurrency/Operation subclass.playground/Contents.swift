import UIKit

final class ShiftOperation: Operation {
    
    var outputImage: UIImage?
    
    private var inputImage: UIImage
    
    init(inputImage: UIImage) {
        self.inputImage = inputImage
        super.init()
    }
    
    override func main() {
        sleep(2)
        outputImage = inputImage
    }
}
