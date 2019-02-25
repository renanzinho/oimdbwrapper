//
//  SearchTableViewCell.swift
//  oimdbwrapper
//
//  Created by Renan Freitas on 25/02/19.
//  Copyright © 2019 Renan Freitas. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var title: UILabel!
    
    var session: URLSession!
    var imdbID: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ content: Search) {
        self.year.text = content.year
        self.title.text = content.title
        self.imdbID = content.imdbID
        if content.poster != "N/A" {
            let task = URLSession.shared.dataTask(with: URL(string: content.poster)!) { (data, response, error) in
                DispatchQueue.main.async {
                    self.img.image = UIImage(data: data!)
                }
            }
            task.resume()
        }
//        self.session = URLSession(configuration: .ephemeral, delegate: self, delegateQueue: nil)
//        if self.img.image == UIImage(named: "spinner") {
//            let task = self.session.dataTask(with: URL(string: content.poster)!)
//            task.resume()
//        }
        
        
    }

}

extension SearchTableViewCell: URLSessionDataDelegate, URLSessionTaskDelegate {
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        DispatchQueue.main.async {
            self.img.image = UIImage(data: data)
        }
    }
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        print("\n\n\(response)")
        completionHandler(.allow)
    }
    func urlSession(_ session: URLSession, didBecomeInvalidWithError error: Error?) {
        print("DEU N BOI\n\(error)")
    }
}
