//
//  ExpenseTrackView.swift
//  Expenses Tracker
//
//  Created by Viraj Fernando on 2023-09-26.
//

import SwiftUI

struct ExpenseTrackView: View {
    
    
    var body: some View {
        NavigationView{
            Text("Expense Tracking")
                .navigationTitle("Expenses")
        }
    }
}

struct ExpenseTrackView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseTrackView()
    }
}
