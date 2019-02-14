//
//  TimeCategory+CoreDataClass.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/11/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//
//

import Foundation
import CoreData

@objc(TimeCategory)
public class TimeCategory: NSManagedObject {
    
    convenience init(title: String,
                     questions: [Question],
                     moc: NSManagedObjectContext) {
        let entity = NSEntityDescription.entity(forEntityName: "TimeCategory", in: moc)
        self.init(entity: entity!, insertInto: moc)
        self.title = title
        self.questions = NSOrderedSet(array: questions)
    }
}
