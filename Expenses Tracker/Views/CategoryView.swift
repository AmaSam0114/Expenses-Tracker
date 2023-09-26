//
//  CategoryView.swift
//  Expenses Tracker
//
//  Created by Viraj Fernando on 2023-09-25.
//

import SwiftUI

struct CategoryView: View {
    @State private var isAlertShowing = false
    @State private var newCategoryName: String = ""
    @State private var categories: [Category] = [
    Category(id: 0, name: "Groceries"),
    Category(id: 1, name: "Transport"),
    Category(id: 2, name: "Bills")
    ]
    
    var body: some View {
        
        VStack{
            Text("Categories")
                
            List{
                ForEach(categories){category in
                    HStack{
                        
                        Text(category.name)
                    }
                    
                }
                
            }
            //.scrollContentBackground(.hidden)
           // Spacer()
            HStack(spacing: 16){
                ZStack(alignment: .trailing){
                    
                        TextField("Add New Category",text: $newCategoryName)
                            .textFieldStyle(.roundedBorder)
                            .padding(.vertical,150)
                        
                        
                        if newCategoryName.count > 0{
                            Button{
                                newCategoryName = ""
                                
                            }label: {
                                Label("Clear input",systemImage: "xmark.circle.fill")
                                    .labelStyle(.iconOnly)
                                    .foregroundColor(.gray)
                                    .padding(.trailing,6)
                            }
                            .alert("Must Provide Category Name", isPresented:$isAlertShowing){
                                Button("Ok",role: .cancel){
                                    isAlertShowing = false
                                }
                            }
                        }
                        
                    }
                
                Button{
                    
                    if newCategoryName.count > 0{
                        categories.append(Category(id: categories.count, name: newCategoryName))
                        newCategoryName = ""
                    }else{
                        isAlertShowing = true
                        
                    }
                    
                }label: {
                    Label("Submit",systemImage: "paperplane.fill")
                        .labelStyle(.iconOnly )
                        .padding(.top,6)
                }
                
                .padding(.top,6)
            }
            .padding(.horizontal,16)
            
        }
        
        
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
