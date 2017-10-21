//
//  StoreVC.swift
//  Ecom
//
//  Created by Calvin Fair on 10/21/17.
//  Copyright © 2017 Calvin Fair. All rights reserved.
//

import UIKit

class StoreVC: UIViewController {

    //////////////
    //  Outlets //
    //////////////
    @IBOutlet weak var moneyLbl: UILabel!
    
    //////////////////
    //  Variables   //
    //////////////////
    var money:Double = 1000.00
    
    //////////////////
    //  Functions   //
    //////////////////
    override func viewDidLoad() {
        super.viewDidLoad()
        moneyLbl.text = "Money: $\(money)"
    }
    
    // This function updates how much money the user has left.
    // It also displays success and failure messages.
    func purhcaseItem(itemValue: Double) {
        if (itemValue <= money) {
            money = money - itemValue
            moneyLbl.text = "Money: $\(money)"
            showAlert(alert: self.purchaseConfirm())
        }
        else {
            showAlert(alert: self.NoFunds())
        }
        
    }
    
    //////////////
    //  Actions //
    //////////////
    @IBAction func buyOneBtnPressed(_ sender: Any) {
        purhcaseItem(itemValue: 100.00)
    }
    @IBAction func buyTwoBtnPressed(_ sender: Any) {
        purhcaseItem(itemValue: 300.00)
    }
    @IBAction func buyThreeBtnPressed(_ sender: Any) {
        purhcaseItem(itemValue: 500.00)
    }
}

// I'm using en extension of the StoreVC to make UI Alerts
// This make the app more resposive to the user.
extension StoreVC {
    func alertWithTitle(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"Ok", style: .cancel, handler: nil))
        return alert
    }
    
    func showAlert(alert: UIAlertController) {
        guard let _ = self.presentedViewController else {
            self.present(alert, animated: true, completion: nil)
            return
        }
    }
    
    func NoFunds() -> UIAlertController {
        let alert = UIAlertController(title: "Uh oh!", message: "It appears you have insufficient funds.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"Ok", style: .cancel, handler: nil))
        return alert
    }
    
    func purchaseConfirm() -> UIAlertController {
        let alert = UIAlertController(title: "Confirmation", message: "Your purchase was sucessful!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"Ok", style: .cancel, handler: nil))
        return alert
    }
}
