//
//  Articles.swift
//  NewsApp
//
//  Created by Arber Basha on 7.11.19.
//  Copyright © 2019 Arber Basha. All rights reserved.
//

import Foundation


struct Articles: Decodable, Identifiable {
    let id: UUID?
    let source: Source?
    let author: String?
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}


struct Source: Decodable {
    let id: String?
    let name: String?
}
