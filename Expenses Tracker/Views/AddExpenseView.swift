//
//  AddExpenseView.swift
//  Expenses Tracker
//
//  Created by Viraj Fernando on 2023-09-23.
//

import SwiftUI

struct AddExpenseView: View {
    
    @State private var expenseName = ""
    @State private var expenseAmount = ""
    @State private var expensedescription = ""
    @State private var expenseDate = Date()
    @State private var selectedCategory = "Select category"
    
    //@EnvironmentObject var expenseCategory: CategoryViewModel
    let expenseCategories = ["Groceries", "Transport", "Food", "Medical and Healthcare", "Bill","Other"]
    
    var body: some View {
        NavigationView {
            List{
                
                HStack {
                    Text("Expense Name:")
                    Spacer()
                    TextField("Name", text: $expenseName)
                        .multilineTextAlignment(.trailing)
                        .submitLabel(.done)
                    
                }
                HStack {
                    Text("Amount:")
                    Spacer()
                    TextField("Amount", text: $expenseAmount)
                        .multilineTextAlignment(.trailing)
                        .submitLabel(.done)
                        .keyboardType(.numberPad)
                }
                HStack {
                    Text("Date")
                    Spacer()
                    DatePicker("Expense Date", selection: $expenseDate, displayedComponents: .date)
                }
                HStack {
                    Text("Note")
                    Spacer()
                    TextField("Note", text: $expensedescription)
                        .multilineTextAlignment(.trailing)
                        .submitLabel(.done)
                }
                
                HStack {
                    Text("Category")
                    Spacer()
                    Picker("Select Category", selection: $selectedCategory) {
                        ForEach(expenseCategories, id: \.self) { category in
                            Text(category)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                
                HStack{
                    Button(action: {
                        // Add your code to save the expense here
                    }) {
                        Text("Add")
                            .frame(maxWidth: .infinity, alignment: .center)
                            .foregroundColor(.blue)
                    }
                    .disabled(expenseName.isEmpty || expenseAmount.isEmpty)
                }
            }
            
            
        }
        
    }
    
}
    


    struct AddExpenseView_Previews: PreviewProvider {
        static var previews: some View {
            AddExpenseView()
        }
    }

