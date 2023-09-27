//
//  Expense.swift
//  Expenses Tracker
//
//  Created by Viraj Fernando on 2023-09-20.
//

import Foundation
import SwiftData

struct Expense{
    let id = UUID()
    let name: String
    let category: CategoryViewModel
    let amount: String
    let description: String
    let date: Date
    
    init
}
