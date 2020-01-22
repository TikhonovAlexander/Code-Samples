//
//  Video+CoreDataProperties.swift
//  Video
//
//  Created by atikhonov on 22.01.2020.
//  Copyright © 2020 atikhonov. All rights reserved.
//
//

import Foundation
import CoreData


extension Video {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Video> {
        return NSFetchRequest<Video>(entityName: "Video")
    }

    @NSManaged public var videoName: String?

}
