//
//  Type.swift
//  oimdbwrapper
//
//  Created by Renan Freitas on 24/02/19.
//  Copyright © 2019 Renan Freitas. All rights reserved.
//

import Foundation

enum Type: String, Codable {
    case movie = "movie"
    case series = "series"
    case episode = "episode"
}
