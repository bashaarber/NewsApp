//
//  City.swift
//  NewsApp
//
//  Created by Arber Basha on 11.11.19.
//  Copyright © 2019 Arber Basha. All rights reserved.
//

import UIKit

class City: NSObject, Identifiable {
    var id: Int = 0
    var name: String = ""
    var cityId: Int = 0
    var image: String = ""
    
    
    init(id: Int, name: String , cityId: Int, image: String) {
        self.id = id
        self.name = name
        self.cityId = cityId
        self.image = image
    }
}
