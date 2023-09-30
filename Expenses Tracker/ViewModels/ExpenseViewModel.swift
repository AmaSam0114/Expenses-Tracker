//
//  ExpenseViewModel.swift
//  Expenses Tracker
//
//  Created by Viraj Fernando on 2023-09-29.
//

import Foundation
import Firebase


class ExpenseViewModel: ObservableObject {
    
    @Published var list = [Expense]()
    
    
    func getData(){
        // get a reference to the database
        let db = Firestore.firestore()
        
        
        //read the document at a specific path
        db.collection("expenses").getDocuments { snapshot, error in
            // check for errors
            if error == nil {
                
                if let snapshot = snapshot{
                    
                    DispatchQueue.main.async {
                        //get all documents and create expenses
                        self.list = snapshot.documents.map { d in
                            return Expense(id: d.documentID, name: d["name"] as? String ?? "" ,
                                           category: d["category"] as? String ?? "",
                                           amount: d["amount"] as? Double ??  0.00,
                                           description: d["description"] as? String ?? "",
                                           date: d["date"] as? Date ?? Date())
                        }
                    }
                    
                    
                }
                
            }else{
                
            }
        }
            
        
    }
    
}
