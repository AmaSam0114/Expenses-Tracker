//
//  Category.swift
//  Expenses Tracker
//
//  Created by Viraj Fernando on 2023-09-27.
//

import Foundation

struct Category: Identifiable{
    var id: String {
            self.name
        }
  //  let id = UUID()
    var name : String
   var imageName:String
   // var color: Color
}
