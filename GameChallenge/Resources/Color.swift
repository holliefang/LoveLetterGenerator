//
//  Color.swift
//  GameChallenge
//
//  Created by Sihan Fang on 2018/12/19.
//  Copyright © 2018 Sihan Fang. All rights reserved.
//

import UIKit

class Color: UIViewController {
    
    @IBOutlet weak var recipientLabel: UILabel!
    @IBOutlet weak var senderLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var changeColorBtn: UIButton!
    @IBOutlet weak var luckyDrawBtn: UIButton!
    
    var isColorChanged: Bool = false


    @IBAction func changeColorToGreen(_ sender: UIButton) {
        if !isColorChanged {
            UIView.animate(withDuration: 0.4) {
                
                self.view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
                self.recipientLabel.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
                self.senderLabel.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
                self.textLabel.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
                self.dateLabel.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
                self.changeColorBtn.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
                self.luckyDrawBtn.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
                
                self.recipientLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.senderLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.textLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.dateLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.changeColorBtn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , for: .normal)
                self.luckyDrawBtn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , for: .normal)
                
            }
            
            isColorChanged = !isColorChanged
        } else {
            UIView.animate(withDuration: 0.4) {
                
                self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.recipientLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.senderLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.textLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.dateLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.changeColorBtn.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                self.luckyDrawBtn.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
                self.recipientLabel.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
                self.senderLabel.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
                self.textLabel.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
                self.dateLabel.textColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
                self.changeColorBtn.setTitleColor(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1) , for: .normal)
                self.luckyDrawBtn.setTitleColor(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1) , for: .normal)
                
            }
            
            isColorChanged = !isColorChanged
        }
    }
    
}
