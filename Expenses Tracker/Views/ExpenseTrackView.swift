//
//  ExpenseTrackView.swift
//  Expenses Tracker
//
//  Created by Viraj Fernando on 2023-09-26.
//

import SwiftUI
import Firebase

struct ExpenseTrackView: View {
    
    @ObservedObject var model = ExpenseViewModel()
    var body: some View {
       
        List(model.list) { expense in
                    VStack(alignment: .leading) {
                        Text(expense.name)
                            .font(.headline)
                        Text(String(format: "$%.2f", expense.amount))
                            .font(.subheadline)
                        Text(expense.category)
                            .font(.headline)
                        Text(expense.date, style: .date)
                            .font(.subheadline)
                    }
                }

            }
    
    init(){
        model.getData()
        
    }
    
        }

        


struct ExpenseTrackView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseTrackView()
    }
}
