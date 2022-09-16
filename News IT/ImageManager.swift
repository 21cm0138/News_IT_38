//
//  ImageManager.swift
//  ITnews
//
//  Created by cmStudent on 2022/09/06.
//

import SwiftUI

struct ImageManager {
    
    static func uiImage(from url: URL) -> UIImage{
        guard let data = try? Data(contentsOf: url) else {
            return UIImage(named: "image")!
        }
        
        return UIImage(data: data) ?? UIImage(named: "noImage")!
    }
}
