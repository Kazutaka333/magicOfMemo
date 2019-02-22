//
//  QuestionData+CoreDataClass.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/18/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//
//

import Foundation
import CoreData

@objc(QuestionData)
public class QuestionData: NSManagedObject, Decodable {
    enum CodingKeys: String, CodingKey {
        case levels = "levels"
    }
    
    public required convenience init(from decoder: Decoder) throws {
        guard let key = CodingUserInfoKey.context,
            let moc = decoder.userInfo[key] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "QuestionData", in: moc)
            else { fatalError() }
        self.init(entity: entity, insertInto: moc)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let levels = try container.decodeIfPresent([Level].self, forKey: .levels) ?? []
        self.addToLevels(NSOrderedSet(array: levels))
    }
}
