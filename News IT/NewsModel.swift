//
//  NewsModel.swift
//  ITnews
//
//  Created by cmStudent on 2022/09/06.
//

import SwiftUI

struct NewsModel: Identifiable {
    let id = UUID()
    let title: String
    let pubDate: String
    let imageURL: String
    var image: UIImage
    let description: String
    
    
    init(title:String,pubDate:String,imageURL:String,image:UIImage,description:String) {
        self.title = title
        self.pubDate = pubDate
        self.imageURL = imageURL
        self.image = image
        self.description = description
    }
    
    
    mutating func setImage(image:UIImage){
        self.image = image
    }
 
}


