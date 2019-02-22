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
public class TimeCategory: NSManagedObject, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case questions = "questions"
    }

    public required convenience init(from decoder: Decoder) throws {
        guard let key = CodingUserInfoKey.context,
            let moc = decoder.userInfo[key] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "TimeCategory", in: moc)
            else { fatalError() }
        self.init(entity: entity, insertInto: moc)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        let questions = try container.decodeIfPresent([Question].self, forKey: .questions) ?? []
        self.addToQuestions(NSOrderedSet(array: questions)) 
    }
}
