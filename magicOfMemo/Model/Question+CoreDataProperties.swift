//
//  Question+CoreDataProperties.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/11/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//
//

import Foundation
import CoreData


extension Question {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Question> {
        return NSFetchRequest<Question>(entityName: "Question")
    }

    @NSManaged public var text: String
    @NSManaged public var isDone: Bool
    @NSManaged public var level: Level
    @NSManaged public var timeCategory: TimeCategory

}
