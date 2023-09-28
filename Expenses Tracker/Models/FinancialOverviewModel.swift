//
//  FinancialOverviewModel.swift
//  Expenses Tracker
//
//  Created by Viraj Fernando on 2023-09-28.
//

import Foundation


struct FinancialOverview {
    var income: Double
    var expenses: Double
    var savings: Double {
        return income - expenses
    }
}
