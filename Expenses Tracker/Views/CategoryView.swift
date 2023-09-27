//
//  CategoryView.swift
//  Expenses Tracker
//
//  Created by Viraj Fernando on 2023-09-25.
//

import SwiftUI

struct CategoryView: View {
    @StateObject var viewModel = CategoryViewModel()

     //   private let gridItemLayout = [GridItem(.flexible(minimum: 100, maximum: 200), spacing: 16)]
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body: some View {
        NavigationView {
                    ScrollView {
                        LazyVGrid(columns: adaptiveColumns, spacing: 16) {
                            ForEach(viewModel.categories) { category in
                                NavigationLink(destination: Text(category.name)) {
                                    //CategoryCardView(category: category)
                                    VStack {
                                                Image(category.imageName)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(height: 100)
                                                    .cornerRadius(10)

                                                Text(category.name)
                                                    .font(.headline)
                                                    .padding(.top, 4)
                                            }
                                            .padding(8)
                                            .background(Color.white)
                                            .cornerRadius(10)
                                            .shadow(radius: 5)
                                }
                            }
                        }
                        .padding()
                    }
                    .navigationTitle("Categories")
                }
            }
        
    }


struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
