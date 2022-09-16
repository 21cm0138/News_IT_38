//
//  JSONModel.swift
//  ITnews
//
//  Created by cmStudent on 2022/09/06.
//

//json整形
//https://app.quicktype.io/

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let attributes: Attributes
    let channel: Channel

    enum CodingKeys: String, CodingKey {
        case attributes = "@attributes"
        case channel
    }
}

// MARK: - Attributes
struct Attributes: Codable {
    let version: String
}

// MARK: - Channel
struct Channel: Codable {
    let language, copyright, pubDate, title: String
    let link: String
    let channelDescription: String
    let image: Images
    let item: [Item]

    enum CodingKeys: String, CodingKey {
        case language, copyright, pubDate, title, link
        case channelDescription = "description"
        case image, item
    }
}

// MARK: - Image
struct Images: Codable {
    let title: String
    let link: String
    let url: String
    let width, height: String
}

// MARK: - Item
struct Item: Codable {
    let title: String
    let link: String
    let pubDate: String
    let image: String
    let comments: String
    let itemDescription: String

    enum CodingKeys: String, CodingKey {
        case title, link, pubDate, image, comments
        case itemDescription = "description"
    }
}


