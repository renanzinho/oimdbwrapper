////
////  Movie.swift
////  oimdbwrapper
////
////  Created by Renan Freitas on 22/02/19.
////  Copyright © 2019 Renan Freitas. All rights reserved.
////
//
//import UIKit
//
//class Movie {
//    
//    let title: String
//    let year: Int?
//    let rated: String?
//    let released: Date?
//    let runtimeMin: Int?
//    let genre: [String]?
//    let director: [String]?
//    let writer: [String]?
//    let actors: [String]?
//    let plot: String?
//    let language: [String]?
//    let country: [String]?
//    let awards: [String]?
//    let poster: URL?
//    let ratings: [String:String?]!
//    let metaScore: Int?
//    let imdbRating: Float?
//    let imdbVotes: Int?
//    let imdbID: String
//    let type: Type
//    let dvd: Date?
//    let boxOfficeDollars: Float?
//    let production: String?
//    let website: String?
//    
//    init(_ dictionary: [String: Any]) {
//        self.title = dictionary["Title"] as! String
//        
//        if dictionary["Year"] as! String != "N/A" {
//            self.year = dictionary["Year"] as? Int
//        }
//        
//        if dictionary["Rated"] as! String != "N/A" {
//            self.rated = dictionary["Rated"] as? String
//        }
//        
//        if dictionary["Released"] as! String != "N/A" {
//            let df = DateFormatter()
//            df.dateFormat = "dd MMM yyyy"
//            self.released = df.date(from: dictionary["Released"] as! String)
//        }
//        
//        if dictionary["Runtime"] as! String != "N/A" {
//            self.runtimeMin = Int((dictionary["Runtime"] as! String).components(separatedBy: " ")[0])
//        }
//        
//        if dictionary["Genre"] as! String != "N/A" {
//            self.genre = (dictionary["Genre"] as! String).components(separatedBy: ",").map({ $0.trimmingCharacters(in: .whitespaces) })
//        }
//        
//        if dictionary["Director"] as! String != "N/A" {
//            self.director = (dictionary["Director"] as! String).components(separatedBy: ",").map({ $0.trimmingCharacters(in: .whitespaces) })
//        }
//        
//        if dictionary["Writer"] as! String != "N/A" {
//            self.writer = (dictionary["Writer"] as! String).components(separatedBy: ",").map({ $0.trimmingCharacters(in: .whitespaces) })
//        }
//        
//        if dictionary["Actors"] as! String != "N/A" {
//            self.actors = (dictionary["Actors"] as! String).components(separatedBy: ",").map({ $0.trimmingCharacters(in: .whitespaces) })
//        }
//        
//        if dictionary["Plot"] as! String != "N/A" {
//            self.plot = (dictionary["Plot"] as! String)
//        }
//        
//        if dictionary["Language"] as! String != "N/A" {
//            self.language = (dictionary["Language"] as! String).components(separatedBy: ",").map({ $0.trimmingCharacters(in: .whitespaces) })
//        }
//        
//        if dictionary["Country"] as! String != "N/A" {
//            self.country = (dictionary["Country"] as! String).components(separatedBy: ",").map({ $0.trimmingCharacters(in: .whitespaces) })
//        }
//        
//        if dictionary["Poster"] as! String != "N/A" {
//            self.poster = URL(string: dictionary["Poster"] as! String)
//        }
//        
//        self.ratings = dictionary["Ratings"] as! Dictionary<String,String>
//        
////        for i in self.ratings {
////            if i.value == "N/A" {
////                i.value = nil
////            }
////            else if
////        }
//        
//        
//        
//        
//    }
//    
//    
//}
