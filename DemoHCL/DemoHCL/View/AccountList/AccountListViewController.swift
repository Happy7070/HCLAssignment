//
//  AccountListViewController.swift
//  DemoHCL
//
//  Created by hapy gohil on 16/11/23.
//

import UIKit
import SwiftUI

class AccountListViewController: UIViewController {
    
    @IBOutlet weak var tvAccountList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Account List"
        
        let accounttingView = AccountListingView()
        self.host(component: AnyView(accounttingView), into: self.view)
    }

}


extension UIViewController {
    func host(component: AnyView, into targetView: UIView) {
        let controller = UIHostingController(rootView: component)
        self.addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        targetView.addSubview(controller.view)
        controller.didMove(toParent: self)

        NSLayoutConstraint.activate([
            controller.view.widthAnchor.constraint(equalTo: targetView.widthAnchor, multiplier: 1),
            controller.view.heightAnchor.constraint(equalTo: targetView.heightAnchor, multiplier: 1),
            controller.view.centerXAnchor.constraint(equalTo: targetView.centerXAnchor),
            controller.view.centerYAnchor.constraint(equalTo: targetView.centerYAnchor)
        ])
    }
}
