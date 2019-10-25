//
//  UserPostModel.swift
//  AndersenCoreDataApp
//
//  Created by admin on 24.10.2019.
//  Copyright © 2019 Viacheslav Savitsky. All rights reserved.
//

import Foundation
import UIKit

class UserPostModel: Encodable, Decodable {
    var results: [UserModelz]
}

class UserModelz: Encodable, Decodable {
    var name: NameUserModelz
    var location: LocationModelz
}

class NameUserModelz: Encodable, Decodable {
    var title: String
    var first: String
    var last: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case first
        case last
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decode(String.self, forKey: .title)
        self.first = try container.decode(String.self, forKey: .first)
        self.last = try container.decode(String.self, forKey: .last)
    }
}

class LocationModelz: Encodable, Decodable {
    var street: StreetModelz
}

class StreetModelz: Encodable, Decodable {
    var name: String
}
