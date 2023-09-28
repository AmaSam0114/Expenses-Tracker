//
//  TransactionModel.swift
//  Expenses Tracker
//
//  Created by Viraj Fernando on 2023-09-28.
//

import Foundation

struct Transaction: Identifiable{
    let id:Int
    let date:Date
    let category:CategoryViewModel
    let amount: Int
}
