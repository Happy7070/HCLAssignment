//
//  AccountListingView.swift
//  DemoHCL
//
//  Created by hapy gohil on 17/11/23.
//

import SwiftUI

struct AccountListingView: View {
    @State var accountListData : [AccountListElement] = []
    var body: some View {
        
        List (accountListData){ accountData in
            VStack {
                HStack{
                    Text("Account Number : \(accountData.id)")
                    Spacer()
                }
                HStack{
                    Text("Type : \(accountData.type)" )
                    Spacer()
                }
                HStack{
                    Text("Balance : \(String(accountData.balance))" )
                    Spacer()
                }
            }
        }
        .onAppear{
            let viewModel = AccountListViewModel()
            viewModel.getAccountList() { (resp , error) in
                self.accountListData = resp.sorted(by: { $0.id < $1.id })
            }
        }
    }
}

struct AccountListingView_Previews: PreviewProvider {
    static var previews: some View {
        AccountListingView()
    }
}
