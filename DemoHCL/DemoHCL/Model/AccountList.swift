//
//  AccountList.swift
//  DemoHCL
//
//  Created by hapy gohil on 16/11/23.
//

import Foundation

struct AccountListElement: Codable ,Identifiable {
    
    let type, id: String
    let balance: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "number"
        case balance
        case type
    }
}

typealias AccountList = [AccountListElement]
