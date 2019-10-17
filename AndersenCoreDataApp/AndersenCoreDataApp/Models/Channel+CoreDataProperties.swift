//
//  Channel+CoreDataProperties.swift
//  AndersenCoreDataApp
//
//  Created by admin on 17.10.2019.
//  Copyright © 2019 Viacheslav Savitsky. All rights reserved.
//
//

import Foundation
import CoreData


extension Channel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Channel> {
        return NSFetchRequest<Channel>(entityName: "Channel")
    }

    @NSManaged public var logoChannel: Data?
    @NSManaged public var nameChannel: String?

}
