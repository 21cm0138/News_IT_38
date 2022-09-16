//
//  NewsResponse.swift
//  News IT
//
//  Created by cmStudent on 2022/09/06.
//

import Foundation

struct NewsResponse {
    
    var newsElements: [NewsElement]
    
   
    
    struct NewsElement {
        let name: String
        let imageURL: URL?
    }
}

extension NewsResponse.NewsElement:Comparable{
    static func < (lhs: NewsResponse.NewsElement, rhs: NewsResponse.NewsElement) -> Bool {
        lhs.name < rhs.name
    }
    
}

extension NewsResponse: Decodable {
    struct NewsCodingKey:CodingKey {
        var stringValue:String
        init? (stringValue: String) {
            self.stringValue = stringValue
        }
        var intValue: Int?
        init? (intValue: Int) { nil }
        static let name = NewsCodingKey(stringValue: "name")!
        static let imageURL = NewsCodingKey(stringValue: "emojiURL")!
        
    }
    init(from decoder: Decoder) throws {
        newsElements = []
        let container = try decoder.container(keyedBy: NewsCodingKey.self)
        for key in container.allKeys {
            
            let newsElement = NewsElement(name: key.stringValue,
                                            imageURL: try container.decode(URL.self,
                                                                           forKey: NewsCodingKey(stringValue: key.stringValue)!)
                                          )
            newsElements.append(newsElement)
        }
    }
}
