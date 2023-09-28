//
//  FinancialDataServiceModel.swift
//  Expenses Tracker
//
//  Created by Viraj Fernando on 2023-09-28.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class FinancialDataService: ObservableObject {
    private var db = Firestore.firestore()
    
    @Published var financialData: FinancialOverview?
    
    func fetchData() {
        db.collection("financial_data").document("user_id_here").addSnapshotListener { (document, error) in
            guard let document = document, document.exists else {
                print("Document does not exist")
                return
            }
            
            do {
                self.financialData = try document.data(as: FinancialOverview.self)
            } catch {
                print("Error decoding financial data: \(error)")
            }
        }
    }
}
