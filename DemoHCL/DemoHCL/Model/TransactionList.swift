//
//  TransactionList.swift
//  DemoHCL
//
//  Created by hapy gohil on 16/11/23.
//

import Foundation
import SwiftUI
struct TransactionList: Codable {
    
    
    let transactions: [Transaction]
}

// MARK: - Transaction
struct Transaction: Codable  , Identifiable{
    

    
    let  value, date: Int
    let type: String
    let id = UUID()

        enum CodingKeys: CodingKey {
            case value
            case date
            case type
        }

    
}

