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
public class Level: NSManagedObject, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case timeCategories = "timeCategories"
    }
    
    public required convenience init(from decoder: Decoder) throws {
        guard let key = CodingUserInfoKey.context,
            let moc = decoder.userInfo[key] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "TimeCategory", in: moc)
            else { fatalError() }
        self.init(entity: entity, insertInto: moc)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        let categories = try container.decodeIfPresent([TimeCategory].self, forKey: .timeCategories) ?? []
        self.timeCategories = NSOrderedSet(array: categories)
        var questions: [Question] = []
        for category in categories {
            if let cateoryQuestions = category.questions.array as? [Question] {
                questions.append(contentsOf: cateoryQuestions)
            }
        }
        self.questions = NSOrderedSet(array: questions)
    }

}
