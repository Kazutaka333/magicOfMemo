//
//  Question+CoreDataClass.swift
//  magicOfMemo
//
//  Created by Kazutaka Homma on 2/11/19.
//  Copyright © 2019 Kazutaka. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Question)
public class Question: NSManagedObject, Decodable {
    
    enum CodingKeys: String, CodingKey {
        case text = "text"
    }
    
    public required convenience init(from decoder: Decoder) throws {
        guard let key = CodingUserInfoKey.context,
            let moc = decoder.userInfo[key] as? NSManagedObjectContext,
            let entity = NSEntityDescription.entity(forEntityName: "Question", in: moc)
        else { fatalError() }
        self.init(entity: entity, insertInto: moc)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decodeIfPresent(String.self, forKey: .text) ?? ""
    }
    
}

