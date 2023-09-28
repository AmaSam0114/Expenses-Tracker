//
//  Expense.swift
//  Expenses Tracker
//
//  Created by Viraj Fernando on 2023-09-20.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Expense: Identifiable,Codable{
    @DocumentID var id: String?
    var name: String
    var category: String
    var amount: Double
    var description: String
    var date: Date
    
    
}
extension Expense: DocumentSerializable {
    var documentData: [String : Any] {
        return [
                    "name": name,
                    "amount": amount,
                    "date": Timestamp(date: date),
                    "note": description,
                    "category": category
                ]
    }
    
    init?(id: String, data: [String: Any]) {
        guard
            let name = data["name"] as? String,
            let amount = data["amount"] as? Double,
            let dateTimestamp = data["date"] as? Timestamp,
            let note = data["note"] as? String,
            let category = data["category"] as? String
        else {
            return nil
        }
        self.id = id
        self.name = name
        self.amount = amount
        self.date = dateTimestamp.dateValue()
        self.description = note
        self.category = category
    }
}

protocol DocumentSerializable {
    init?(id: String, data: [String: Any])
    var documentData: [String: Any] { get }
}
