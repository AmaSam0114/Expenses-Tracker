//
//  FinancialOverviewModel.swift
//  Expenses Tracker
//
//  Created by Viraj Fernando on 2023-09-28.
//

import Foundation
import FirebaseFirestoreSwift

struct FinancialOverview:Codable,Identifiable {
    @DocumentID var id: String?
    var income: Double
    var expenses: Double
    var savings: Double {
        return income - expenses
    }
}
