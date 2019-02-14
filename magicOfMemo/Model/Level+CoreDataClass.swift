//
//  Level+CoreDataClass.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/11/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Level)
public class Level: NSManagedObject {
    
    convenience init(title: String,
                     timeCategories: [TimeCategory],
                     moc: NSManagedObjectContext) {
        let entity = NSEntityDescription.entity(forEntityName: "Level", in: moc)
        self.init(entity: entity!, insertInto: moc)
        self.title = title
        self.timeCategories = NSOrderedSet(array: timeCategories)
        var questions: [Question] = []
        for category in timeCategories {
            if let cateoryQuestions = category.questions.array as? [Question] {
                questions.append(contentsOf: cateoryQuestions)
            }
        }
        self.questions = NSOrderedSet(array: questions)
    }
}
