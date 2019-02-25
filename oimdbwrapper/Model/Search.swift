//
//  Search.swift
//  oimdbwrapper
//
//  Created by Renan Freitas on 24/02/19.
//  Copyright © 2019 Renan Freitas. All rights reserved.
//

import UIKit

class Search: Codable {
    let title: String
    let year: String
    let imdbID: String
    let type: Type
    let poster: String
    
    init(title: String, year: String, imdbID: String, type: Type, poster: String) {
        self.title = title
        self.year = year
        self.imdbID = imdbID
        self.type = type
        self.poster = poster
    }
    
    init(_ dictionary: [String:Any]) {
        self.title = dictionary["Title"] as! String
        self.year = dictionary["Year"] as! String
        self.imdbID = dictionary["imdbID"] as! String
        self.type = Type(rawValue: dictionary["Type"] as! String)!
        self.poster = dictionary["Poster"] as! String
    }
    
    
}
