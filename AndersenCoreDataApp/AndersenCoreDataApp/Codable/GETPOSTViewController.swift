//
//  GETPOSTViewController.swift
//  AndersenCoreDataApp
//
//  Created by admin on 23.10.2019.
//  Copyright © 2019 Viacheslav Savitsky. All rights reserved.
//

import UIKit

class GETPOSTViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapPost(_ sender: Any) {
        guard let urlString = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        var request = URLRequest(url: urlString)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content - Type")
        
        let newPost = Post(body: "Slava Ukraine", id: 123, title: "Geroyam Slava", userId: 321)
        
        do {
            let jsonBody = try JSONEncoder().encode(newPost)
            request.httpBody = jsonBody
        } catch {
            print(error)
        }
        
        let session = URLSession.shared
        let task  = session.dataTask(with: request) { (data, _, _) in
            guard let data = data else { return }
            do {
                let sentPost = try JSONDecoder().decode(Post.self, from: data)
                print(sentPost)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    
    @IBAction func didTapGet(_ sender: Any) {
        guard let url = URL(string: "https://jsonplacegolder.typicode.com/users") else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                for user in users {
                    print(user.name)
                }
            } catch {
                print("error")
            }
        }
        task.resume()
    }
    
}
