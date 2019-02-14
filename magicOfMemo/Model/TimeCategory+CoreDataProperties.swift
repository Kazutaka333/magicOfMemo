//
//  TimeCategory+CoreDataProperties.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/11/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//
//

import Foundation
import CoreData


extension TimeCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TimeCategory> {
        return NSFetchRequest<TimeCategory>(entityName: "TimeCategory")
    }

    @NSManaged public var title: String
    @NSManaged public var level: Level
    @NSManaged public var questions: NSOrderedSet

}

// MARK: Generated accessors for questions
extension TimeCategory {

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
