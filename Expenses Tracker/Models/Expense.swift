//
//  Expense.swift
//  Expenses Tracker
//
//  Created by Viraj Fernando on 2023-09-20.
//

import Foundation

struct Expense: Identifiable{
    var id = UUID()
    var name: String
    var category: CategoryViewModel
    var amount: String
    var description: String
    var date: Date
    
    
}
