//
//  ExpenseServiceModel.swift
//  Expenses Tracker
//
//  Created by Viraj Fernando on 2023-09-28.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class ExpenseService: ObservableObject {
    private var db = Firestore.firestore()
    
    @Published var expenses: [Expense] = []
    
    func fetchData() {
        db.collection("expenses").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.expenses = documents.compactMap { document in
                try? document.data(as: Expense.self)
            }
        }
    }
}
