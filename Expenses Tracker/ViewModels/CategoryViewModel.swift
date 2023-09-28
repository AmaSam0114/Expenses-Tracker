//
//  CategoryViewModel.swift
//  Expenses Tracker
//
//  Created by Viraj Fernando on 2023-09-20.
//

import SwiftUI

class CategoryViewModel: ObservableObject {
    @Published var categories: [Category] = [
        Category(name: "Groceries", imageName: "groceries"),
        Category(name: "Transport", imageName: "transport"),
        Category(name: "Food", imageName: "food"),
        Category(name: "Medical and Healthcare", imageName: "healthcare"),
        Category(name: "Bill", imageName: "bill"),
        Category(name: "Other", imageName: "other"),
    ]
}
