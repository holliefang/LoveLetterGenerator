//
//  ViewController.swift
//  GameChallenge
//
//  Created by Sihan Fang on 2018/12/17.
//  Copyright © 2018 Sihan Fang. All rights reserved.
//

import UIKit

class StartedViewController: UIViewController {
    
    @IBOutlet weak var recipientTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var senderTextField: UITextField!
    @IBOutlet weak var generateBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        recipientTextField.alpha = 0
        dateTextField.alpha = 0
        senderTextField.alpha = 0
        generateBtn.alpha = 0
        
        UIView.animate(withDuration: 1.5) {
            self.recipientTextField.alpha = 1
            self.dateTextField.alpha = 1
            self.senderTextField.alpha = 1
            self.generateBtn.alpha = 1
        }
        
        
        
        
        
//        coinLabel.text = "$\(coinNumber)"

        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func generate(_ sender: UIButton) {

        
        guard recipientTextField.text != "",
              dateTextField.text != "",
              senderTextField.text != ""  else { return }

        performSegue(withIdentifier: "ToLoveLetterVCSegue", sender: sender)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
        if let vc = segue.destination as? LoveLetterViewController {
            vc.nameText = recipientTextField.text ?? ""
            vc.dateText = dateTextField.text ?? ""
            vc.senderText = senderTextField.text ?? ""
        }
        
        
    }
        
        
    @IBAction func cancel(_ sender: UIButton) {
//        recipientTextField.text = ""
//        dateTextField.text = ""
//        senderTextField.text = ""
        
        dismiss(animated: true)
    }
    
    
    
    
    
    
}

