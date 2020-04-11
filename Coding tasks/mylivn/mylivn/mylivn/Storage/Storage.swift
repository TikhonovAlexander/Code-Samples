//
//  Storage.swift
//  mylivn
//
//  Created by atikhonov on 09.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//

import Foundation

class Storage {
    
    static func links() -> [URL] {
        let url1 = URL(string: "https://raw.githubusercontent.com/TikhonovAlexander/Code-Samples/master/Files/cats/1.jpeg")!
        let url2 = URL(string: "https://raw.githubusercontent.com/TikhonovAlexander/Code-Samples/master/Files/cats/2.jpg")!
        let url3 = URL(string: "https://raw.githubusercontent.com/TikhonovAlexander/Code-Samples/master/Files/cats/3.jpg")!
        let url4 = URL(string: "https://raw.githubusercontent.com/TikhonovAlexander/Code-Samples/master/Files/cats/4.jpg")!
        let url5 = URL(string: "https://raw.githubusercontent.com/TikhonovAlexander/Code-Samples/master/Files/cats/5.jpeg")!
        let url6 = URL(string: "https://raw.githubusercontent.com/TikhonovAlexander/Code-Samples/master/Files/cats/6.jpg")!
        let url7 = URL(string: "https://raw.githubusercontent.com/TikhonovAlexander/Code-Samples/master/Files/cats/7.jpg")!
        let url8 = URL(string: "https://raw.githubusercontent.com/TikhonovAlexander/Code-Samples/master/Files/cats/8.jpg")!
        let url9 = URL(string: "https://raw.githubusercontent.com/TikhonovAlexander/Code-Samples/master/Files/cats/9.jpeg")!
        let url10 = URL(string: "https://raw.githubusercontent.com/TikhonovAlexander/Code-Samples/master/Files/cats/10.jpg")!
        return [url1, url2, url3, url4, url5, url6, url7, url8, url9, url10]
    }
    
}
