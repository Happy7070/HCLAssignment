//
//  TransactionListViewModel.swift
//  DemoHCL
//
//  Created by hapy gohil on 16/11/23.
//

import Foundation
import SwiftUI

protocol TransactionListProtocol {
    func getTransactionList(CompletionHandler : @escaping (TransactionList?,String?) -> Void)
}


class TransactionListViewModel : TransactionListProtocol{
    
    var arrFilterData : [Transaction] = []
    var arrTransactionList : [Transaction] = []
    func getTransactionList(CompletionHandler : @escaping (TransactionList?,String?) -> Void) {
        
        APIManager.shared.dataRequest(with: "https://m.timwang.au/transactions.json", objectType: TransactionList.self) { (result: Result) in
            switch result {
            case .success(let object):
                print(object)
                self.arrTransactionList = object.transactions
                self.arrFilterData = self.arrTransactionList
                self.sortData(isAsc: false)
                //self.transactionData = object.transactions
                CompletionHandler(object , nil)
                
            case .failure(let error):
                
                CompletionHandler(nil , error.localizedDescription)
                print(error)
            }
        }
    }
    
    func sortData(isAsc : Bool)  {
        if isAsc == true {
            self.arrFilterData = self.arrFilterData.sorted(by: { $0.date < $1.date })
        }
        else{
            self.arrFilterData = self.arrFilterData.sorted(by: { $1.date < $0.date })
        }
        
        print(arrFilterData)
    }
    
    func filterData(value : Int )  {
        if value > 0 {
            self.arrFilterData = self.arrTransactionList.filter { $0.value >= value }
        }
        else if value < 0 {
            self.arrFilterData = self.arrTransactionList.filter { $0.value <= value }
        }
        else
        {
            self.arrFilterData = self.arrTransactionList
        }
    }
}

