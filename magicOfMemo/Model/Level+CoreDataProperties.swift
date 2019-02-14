//
//  Level+CoreDataProperties.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/11/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//
//

import Foundation
import CoreData


extension Level {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Level> {
        return NSFetchRequest<Level>(entityName: "Level")
    }

    @NSManaged public var title: String
    @NSManaged public var timeCategories: NSOrderedSet
    @NSManaged public var questions: NSOrderedSet

}

// MARK: Generated accessors for timeCategories
extension Level {

    @objc(insertObject:inTimeCategoriesAtIndex:)
    @NSManaged public func insertIntoTimeCategories(_ value: TimeCategory, at idx: Int)

    @objc(removeObjectFromTimeCategoriesAtIndex:)
    @NSManaged public func removeFromTimeCategories(at idx: Int)

    @objc(insertTimeCategories:atIndexes:)
    @NSManaged public func insertIntoTimeCategories(_ values: [TimeCategory], at indexes: NSIndexSet)

    @objc(removeTimeCategoriesAtIndexes:)
    @NSManaged public func removeFromTimeCategories(at indexes: NSIndexSet)

    @objc(replaceObjectInTimeCategoriesAtIndex:withObject:)
    @NSManaged public func replaceTimeCategories(at idx: Int, with value: TimeCategory)

    @objc(replaceTimeCategoriesAtIndexes:withTimeCategories:)
    @NSManaged public func replaceTimeCategories(at indexes: NSIndexSet, with values: [TimeCategory])

    @objc(addTimeCategoriesObject:)
    @NSManaged public func addToTimeCategories(_ value: TimeCategory)

    @objc(removeTimeCategoriesObject:)
    @NSManaged public func removeFromTimeCategories(_ value: TimeCategory)

    @objc(addTimeCategories:)
    @NSManaged public func addToTimeCategories(_ values: NSOrderedSet)

    @objc(removeTimeCategories:)
    @NSManaged public func removeFromTimeCategories(_ values: NSOrderedSet)

}

// MARK: Generated accessors for questions
extension Level {

    @objc(insertObject:inQuestionsAtIndex:)
    @NSManaged public func insertIntoQuestions(_ value: Question, at idx: Int)

    @objc(removeObjectFromQuestionsAtIndex:)
    @NSManaged public func removeFromQuestions(at idx: Int)

    @objc(insertQuestions:atIndexes:)
    @NSManaged public func insertIntoQuestions(_ values: [Question], at indexes: NSIndexSet)

    @objc(removeQuestionsAtIndexes:)
    @NSManaged public func removeFromQuestions(at indexes: NSIndexSet)

    @objc(replaceObjectInQuestionsAtIndex:withObject:)
    @NSManaged public func replaceQuestions(at idx: Int, with value: Question)

    @objc(replaceQuestionsAtIndexes:withQuestions:)
    @NSManaged public func replaceQuestions(at indexes: NSIndexSet, with values: [Question])

    @objc(addQuestionsObject:)
    @NSManaged public func addToQuestions(_ value: Question)

    @objc(removeQuestionsObject:)
    @NSManaged public func removeFromQuestions(_ value: Question)

    @objc(addQuestions:)
    @NSManaged public func addToQuestions(_ values: NSOrderedSet)

    @objc(removeQuestions:)
    @NSManaged public func removeFromQuestions(_ values: NSOrderedSet)

}
