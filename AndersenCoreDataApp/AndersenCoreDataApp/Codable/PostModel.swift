//
//  PostModel.swift
//  AndersenCoreDataApp
//
//  Created by admin on 23.10.2019.
//  Copyright © 2019 Viacheslav Savitsky. All rights reserved.
//

import Foundation
import UIKit

class Post: Encodable {
    var body: String
    var id: Int
    var title: String
    var userId: Int
    
    init(body: String, id: Int, title: String, userId: Int) {
        self.body = body
        self.id = id
        self.title = title
        self.userId = userId
    }
}
