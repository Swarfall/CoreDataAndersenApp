//
//  UserGetModel.swift
//  AndersenCoreDataApp
//
//  Created by admin on 24.10.2019.
//  Copyright © 2019 Viacheslav Savitsky. All rights reserved.
//

import Foundation

class UserGetModel: Decodable {
    var results: [UserModel]
}

class UserModel: Decodable {
    var name: NameUserModel
    var location: LocationModel
}

class NameUserModel: Decodable {
    var title: String
    var first: String
    var last: String
}

class LocationModel: Decodable {
    var street: StreetModel
}

class StreetModel: Decodable {
    var name: String
}
