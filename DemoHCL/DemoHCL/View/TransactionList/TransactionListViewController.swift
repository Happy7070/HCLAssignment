//
//  TransactionListViewController.swift
//  DemoHCL
//
//  Created by hapy gohil on 16/11/23.
//

import UIKit
import SwiftUI

class TransactionListViewController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var txtfilterData: UITextField!
    @IBOutlet weak var sortSwitch: UISwitch!
//    var filteredArrayTransations : [Transaction] = []
    @IBOutlet weak var tvTransactionList: UITableView!
    var transactionListVM : TransactionListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Transaction List"

        txtfilterData.delegate = self
        tvTransactionList.dataSource = self
        tvTransactionList.delegate = self

        self.getTransactionData()
        txtfilterData.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {

        let value = Int(textField.text ?? "0") ?? 0
        transactionListVM?.filterData(value: value)
        
        transactionListVM?.sortData(isAsc: self.sortSwitch.isOn)
        self.tvTransactionList.reloadData()
    }

    
    func getTransactionData() {
        transactionListVM = TransactionListViewModel()
        transactionListVM?.getTransactionList(){ (resp,error) in
            
            DispatchQueue.main.async {
                self.sortSwitch.isOn = false
                self.tvTransactionList.reloadData()
            }
        }
    }

    @IBAction func changeSortingDirection(_ sender: Any) {
        
//        let value = Int(txtfilterData.text ?? "0") ?? 0
        transactionListVM?.sortData(isAsc: self.sortSwitch.isOn) 
        self.tvTransactionList.reloadData()
    }
    
}


extension TransactionListViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionListVM?.arrFilterData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvTransactionList.dequeueReusableCell(withIdentifier: "TransactionListCell", for: indexPath) as! TransactionListCell
        
        guard let transactionListObj = self.transactionListVM?.arrFilterData[indexPath.row] else { return cell }
        
        cell.setTransactionData(element: transactionListObj)
        cell.selectionStyle = .none
        return cell
    }
    
    
}
