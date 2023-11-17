//
//  TransactionListCell.swift
//  DemoHCL
//
//  Created by hapy gohil on 16/11/23.
//

import UIKit

class TransactionListCell: UITableViewCell {
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setTransactionData(element : Transaction) {
        
        let date = Date(timeIntervalSince1970: TimeInterval(element.date))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss" //Specify your format that you want let
        let strDate = dateFormatter.string(from: date)

        
        lblType.text = String(format: "Type: %@", element.type)
        lblDate.text = String(format: "Date : %@", strDate)
        lblAmount.text = String(format: "Amount : %d", element.value)
        
    }
}
