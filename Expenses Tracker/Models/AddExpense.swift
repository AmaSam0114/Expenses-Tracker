//
//  AddExpense.swift
//  Expenses Tracker
//
//  Created by Viraj Fernando on 2023-09-28.
//

import Foundation
import SwiftUI

class ExpenseManager: ObservableObject {
    @Published var expenses: [Expense] = []
}
