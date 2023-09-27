//
//  AddExpenseView.swift
//  Expenses Tracker
//
//  Created by Viraj Fernando on 2023-09-23.
//

import SwiftUI

struct AddExpenseView: View {
    
    @EnvironmentObject var expenseManager: ExpenseManager
    @State private var expenseName = ""
    @EnvironmentObject var expenseCategory: CategoryViewModel
    @State private var expenseAmount = ""
    @State private var expenseCescription = ""
    @State private var selectedDate = Date()
    
    
    
    var body: some View {
        VStack{
            List{
                
                TextField("Expense Name", text: $expenseName)
                
              //  Picker("Select Category", selection: $expenseCategory)
                
                TextField("Amount", text: $expenseAmount)
                    .keyboardType(.numberPad)
                TextField("Description", text: $expenseCescription)
                
                DatePicker("Date", selection: $selectedDate, displayedComponents: .date)
                
                
                
                Button(action: {
                    
                }) {
                    Text("Add")
                        .foregroundColor(.blue)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 50)
                }
                
            }
        }
    }
    func addExpense() {
                   
                        let expense = Expense(name: expenseName, category: expenseCategory, amount: expenseAmount, description: expenseCescription, date: selectedDate)
                        expenseManager.expenses.append(expense)
                        expenseName = ""
                    //    expenseCategory.categories.append(expense)
                        expenseAmount = ""
                        expenseCescription = ""
                        selectedDate = Date()
                    
                }

    
}
    struct AddExpenseView_Previews: PreviewProvider {
        static var previews: some View {
            AddExpenseView()
        }
    }

