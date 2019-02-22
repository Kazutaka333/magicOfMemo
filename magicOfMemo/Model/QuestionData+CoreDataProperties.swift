//
//  QuestionData+CoreDataProperties.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/18/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//
//

import Foundation
import CoreData


extension QuestionData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QuestionData> {
        return NSFetchRequest<QuestionData>(entityName: "QuestionData")
    }

    @NSManaged public var levels: NSOrderedSet?

}

// MARK: Generated accessors for levels
extension QuestionData {

    @objc(insertObject:inLevelsAtIndex:)
    @NSManaged public func insertIntoLevels(_ value: Level, at idx: Int)

    @objc(removeObjectFromLevelsAtIndex:)
    @NSManaged public func removeFromLevels(at idx: Int)

    @objc(insertLevels:atIndexes:)
    @NSManaged public func insertIntoLevels(_ values: [Level], at indexes: NSIndexSet)

    @objc(removeLevelsAtIndexes:)
    @NSManaged public func removeFromLevels(at indexes: NSIndexSet)

    @objc(replaceObjectInLevelsAtIndex:withObject:)
    @NSManaged public func replaceLevels(at idx: Int, with value: Level)

    @objc(replaceLevelsAtIndexes:withLevels:)
    @NSManaged public func replaceLevels(at indexes: NSIndexSet, with values: [Level])

    @objc(addLevelsObject:)
    @NSManaged public func addToLevels(_ value: Level)

    @objc(removeLevelsObject:)
    @NSManaged public func removeFromLevels(_ value: Level)

    @objc(addLevels:)
    @NSManaged public func addToLevels(_ values: NSOrderedSet)

    @objc(removeLevels:)
    @NSManaged public func removeFromLevels(_ values: NSOrderedSet)

}
