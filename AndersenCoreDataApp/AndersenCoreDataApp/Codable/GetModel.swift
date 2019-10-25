//
//  Person.swift
//  AndersenCoreDataApp
//
//  Created by admin on 23.10.2019.
//  Copyright © 2019 Viacheslav Savitsky. All rights reserved.
//

import Foundation
import UIKit

class User: Decodable {
    let company: [String: String]
    let email: String
    let id: Int
    let name: String
    let phone: String
    let username: String
    let website: String
}




