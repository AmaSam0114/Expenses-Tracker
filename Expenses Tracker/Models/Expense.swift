//
//  Expense.swift
//  Expenses Tracker
//
//  Created by Viraj Fernando on 2023-09-20.
//

import Foundation


struct Expense: Identifiable{
    var id: String
    var name: String
    var category: String
    var amount: Double
    var description: String
    var date: Date
    
    
}
