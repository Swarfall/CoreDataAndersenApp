//
//  DecodableRandomUserVC.swift
//  AndersenCoreDataApp
//
//  Created by admin on 24.10.2019.
//  Copyright © 2019 Viacheslav Savitsky. All rights reserved.
//

import UIKit

class DecodableRandomUserVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        getData()
    }
    private func getData() {
        guard let url = URL(string: "https://randomuser.me/api/?results=2") else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, responce, error) in
            guard let data = data else { return }
            do {
                let users = try JSONDecoder().decode(UserGetModel.self, from: data)
                print(users.results[0].name.first)
            } catch let error {
                print("Error: \(error)")
            }
        }
        task.resume()
    }

//    private func postData() {
//        guard let url = URL(string: "https://randomuser.me/api/?results=2") else { return }
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "POST"
//        let encoder = JSONEncoder()
//        encoder.keyEncodingStrategy = .custom({ (keys) -> CodingKey in
//            
//        })
//       
//        
//    }
    
}
