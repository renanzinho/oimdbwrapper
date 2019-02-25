//
//  ViewController.swift
//  oimdbwrapper
//
//  Created by Renan Freitas on 21/02/19.
//  Copyright © 2019 Renan Freitas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var mglass: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var searchSession: URLSession?
    var dataTask: URLSessionDataTask?
    
    //    let tempSession = URLSession
    @IBOutlet weak var dale: UILabel!
    
    var cache = [URLSessionDataTask:[String:Any]]()
    
    var result = [Search]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        
        searchSession = URLSession(configuration: config, delegate: self, delegateQueue: nil)
        
        
//        searchMovies("wonder woman")
        
        //        task.resume()
        
        //        print(receivedData)
    }
    
    func searchMovies(_ title: String) {
        guard let url = URL(string: "http://www.omdbapi.com/?s=\(title.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)&apikey=56b55512") else {
            print("CRIOU URL N EIN")
            return
        }
        
        let tasking = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            do {
                let stringDic = try JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
                for i in stringDic!["Search"] as! Array<Dictionary<String,Any>>{
                    self.result.append(Search(i))
                    if i["Poster"] as! String != "N/A" {
                        let task = self.searchSession?.dataTask(with: URL(string: i["Poster"] as! String)!)
                        task?.resume()
                    }
                    self.tableView.reloadData()
                }
                
            } catch let error {
                print(error)
                return
            }
        }
        tasking.resume()
        
    }
    
//    func search(_ title: String) {
//        guard let url = URL(string: "http://www.omdbapi.com/?s=\(title)&apikey=56b55512") else {
//            print("nao criou url")
//            return
//        }
//        let tasking = URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//            if let error = error {
//                print(error)
//            } else {
//                do {
//                    let stringDic = try JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
//                    let x = stringDic!["Search"] as! Array<Dictionary<String,Any>>
//                    for i in x {
//                        let task = self.session?.dataTask(with: URL(string: "http://www.omdbapi.com/?i=\(i["imdbID"] as! String)&apikey=56b55512")!)
//                        task!.resume()
//                    }
//
//                } catch let error {
//                    print(error)
//                }
//            }
//        }
//        tasking.resume()
//    }
}


extension ViewController: URLSessionDataDelegate {
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
//        do {
//            let stringDic = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
//            print("\(stringDic?.keys)")
//        } catch let error {
//            print(error)
//        }
        self.cache[dataTask] = ["data": (data as? Any)]
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
//        print("\n\nResponse: \((response as! HTTPURLResponse).statusCode)")
        self.cache[dataTask] = ["url": (response.url as? Any)]
        print("---------------------------\n\n\(response)\n")
        completionHandler(.allow)
    }
    
    //14338D6F-E3E6-4A0D-BD89-F0E8378B4353
}

extension ViewController: URLSessionTaskDelegate {
    func urlSession(_ session: URLSession, taskIsWaitingForConnectivity task: URLSessionTask) {
        print("\nesperando...\n")
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            
        } else {
            print(textField.text!)
            self.searchMovies(textField.text!.trimmingCharacters(in: .whitespacesAndNewlines))
        }
        self.view.endEditing(true)
        self.mglass.isHidden = false
        return false
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.mglass.isHidden = true
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let content = self.result[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell") as! SearchTableViewCell
        cell.setCell(content)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
}
