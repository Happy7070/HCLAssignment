//
//  AccountListViewModel.swift
//  DemoHCL
//
//  Created by hapy gohil on 16/11/23.
//

import Foundation

protocol AccountListProtocol {
    func getAccountList(CompletionHandler : @escaping (AccountList,String?) -> Void)
}

class AccountListViewModel : AccountListProtocol{
    
    func getAccountList(CompletionHandler : @escaping (AccountList,String?) -> Void) {
        
        APIManager.shared.dataRequest(with: "https://m.timwang.au/accounts.json", objectType: AccountList.self) { (result: Result) in
            switch result {
            case .success(let object):
                print(object)
                
                CompletionHandler(object , nil)
                
            case .failure(let error):
                
                CompletionHandler([] , error.localizedDescription)
                print(error)
            }
        }
    }
    
}

// Typer
