import UIKit

func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
    var newImage = image

    let color = newImage[sr][sc]
    newImage[sr][sc] = newColor
    
    let index = Index(r: sr, c: sc)
    cache.insert(index)
    
    floodFill2(&newImage, sr + 1, sc, color, newColor)
    floodFill2(&newImage, sr - 1, sc, color, newColor)
    floodFill2(&newImage, sr, sc + 1, color, newColor)
    floodFill2(&newImage, sr, sc - 1, color, newColor)

    return newImage
}

struct Index: Hashable {
    var r: Int
    var c: Int
}

var cache: Set<Index> = []

func floodFill2(_ image: inout [[Int]], _ sr: Int, _ sc: Int, _ color: Int, _ newColor: Int) {
    
    let rows = image.count - 1
    let columns = image[rows].count - 1
    
    guard sr <= rows && sr >= 0 else { return }
    guard sc <= columns && sc >= 0 else { return }
    let index = Index(r: sr, c: sc)
    guard !cache.contains(index) else { return }
    cache.insert(index)

    if image[sr][sc] == color {
        image[sr][sc] = newColor
        floodFill2(&image, sr + 1, sc, color, newColor)
        floodFill2(&image, sr - 1, sc, color, newColor)
        floodFill2(&image, sr, sc + 1, color, newColor)
        floodFill2(&image, sr, sc - 1, color, newColor)
    }
}

var image = [[1,1,1],[1,1,0],[1,0,1]]

print(floodFill(image, 1, 1, 2))
cache = []
print(floodFill([[0,0,0],[0,0,0]], 0, 0, 2))
cache = []
print(floodFill([[1,0,0],[1,0,0]], 0, 0, 2))
cache = []
print(floodFill([[1,0,0],[0,1,0]], 0, 0, 2))
cache = []
