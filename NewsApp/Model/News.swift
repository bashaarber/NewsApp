//
//  News.swift
//  NewsApp
//
//  Created by Arber Basha on 7.11.19.
//  Copyright © 2019 Arber Basha. All rights reserved.
//

import Foundation

struct News: Decodable , Identifiable{
    var id: UUID?
    let status: String
    let totalResults: Int
    let articles: [Articles]
}
