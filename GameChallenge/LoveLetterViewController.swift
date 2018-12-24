//
//  LoveLetterViewController.swift
//  GameChallenge
//
//  Created by Sihan Fang on 2018/12/17.
//  Copyright © 2018 Sihan Fang. All rights reserved.
//

import UIKit

class LoveLetterViewController: UIViewController {
    
    @IBOutlet weak var recipientLabel: UILabel!
    @IBOutlet weak var senderLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var changeColorBtn: UIButton!
    @IBOutlet weak var luckyDrawBtn: UIButton!
    @IBOutlet weak var dwarf: UIImageView!
    @IBOutlet weak var greenBtn: UIButton!
    
    var nameText = ""
    var senderText = ""
    var dateText = ""
    var isColorChanged = false
    
    var responseFromDwarf = ""
    var result = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if let isAvailaible = UserDefaults.standard.object(forKey: "isAvailaibel") as? String {
            if isAvailaible == "true" {
                print("Button Availaible or NOT", isAvailaible)
                greenBtn.isHidden = true
            } else {
                print("Button Availaible or NOT", isAvailaible)
                greenBtn.isHidden = false
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        greenBtn.isHidden = false
        
        textLabel.text = loveLetterArray.randomElement()
        
        recipientLabel.text = "Dear \(nameText),"
        senderLabel.text = senderText
        dateLabel.text = "\(dateText),"
        
        //
        
        recipientLabel.alpha = 0
        senderLabel.alpha = 0
        dateLabel.alpha = 0
        textLabel.alpha = 0
        
        UIView.animate(withDuration: 1.5) {
            self.recipientLabel.alpha = 1
            self.senderLabel.alpha = 1
            self.dateLabel.alpha = 1
            self.textLabel.alpha = 1

        }
    

        
    }
    
    var loveLetterArray: [String] = [
        
    """
    How are you, on this wonderful day?
    I thought this note would bring a smile to your face.
    Listen dear, I just wanted to tell you just how great you really are.
    Wishing you a happiest day!
    
    """,
    
    """
    I am missing you dearly.
    You and I are perfect together.
    I need you more than mere words can say and I would do anything for you.
    Please continue to be my life, my love & my inspiration and if possible,
    let me prove my love to you.
    If you believe in love,
    I would be willing to show you my love .
    I hope and pray you will allow me the chance.
    """
    ,
    
    """
    How is my sweet lovely one on this day?
    I just wanted to tell you that you've always been a wonderful part of my life.
    Whenever I think of you I melt and get a fuzzy feeling on the inside.
    There's just something about you which I can't help liking.
    I will be thinking of you my darling!

    """
    
    ,
    
    "I LOVE YOU."
    
    
    ]
    
    @IBAction func changeColor(_ sender: UIButton) {
        if !isColorChanged {
            UIView.animate(withDuration: 0.4) {
                
                self.view.backgroundColor = #colorLiteral(red: 0.845177665, green: 0.4215331046, blue: 0.4057041513, alpha: 1)
                self.recipientLabel.backgroundColor = #colorLiteral(red: 0.845177665, green: 0.4215331046, blue: 0.4057041513, alpha: 1)
                self.senderLabel.backgroundColor = #colorLiteral(red: 0.845177665, green: 0.4215331046, blue: 0.4057041513, alpha: 1)
                self.textLabel.backgroundColor = #colorLiteral(red: 0.845177665, green: 0.4215331046, blue: 0.4057041513, alpha: 1)
                self.dateLabel.backgroundColor = #colorLiteral(red: 0.845177665, green: 0.4215331046, blue: 0.4057041513, alpha: 1)
                self.changeColorBtn.backgroundColor = #colorLiteral(red: 0.845177665, green: 0.4215331046, blue: 0.4057041513, alpha: 1)
                self.luckyDrawBtn.backgroundColor = #colorLiteral(red: 0.845177665, green: 0.4215331046, blue: 0.4057041513, alpha: 1)
                
                self.recipientLabel.textColor = UIColor.white
                self.senderLabel.textColor = UIColor.white
                self.textLabel.textColor = UIColor.white
                self.dateLabel.textColor = UIColor.white
                self.changeColorBtn.setTitleColor(.white , for: .normal)
                self.luckyDrawBtn.setTitleColor(.white , for: .normal)
                
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
                
                self.recipientLabel.textColor = #colorLiteral(red: 0.845177665, green: 0.4215331046, blue: 0.4057041513, alpha: 1)
                self.senderLabel.textColor = #colorLiteral(red: 0.845177665, green: 0.4215331046, blue: 0.4057041513, alpha: 1)
                self.textLabel.textColor = #colorLiteral(red: 0.845177665, green: 0.4215331046, blue: 0.4057041513, alpha: 1)
                self.dateLabel.textColor = #colorLiteral(red: 0.845177665, green: 0.4215331046, blue: 0.4057041513, alpha: 1)
                self.changeColorBtn.setTitleColor(#colorLiteral(red: 0.845177665, green: 0.4215331046, blue: 0.4057041513, alpha: 1) , for: .normal)
                self.luckyDrawBtn.setTitleColor(#colorLiteral(red: 0.845177665, green: 0.4215331046, blue: 0.4057041513, alpha: 1) , for: .normal)
                
            }
            
            isColorChanged = !isColorChanged
        }

        
        
       
        
        }
        
        
    
    @IBAction func luckyDraw(_ sender: Any) {
        
        
        var numberArray = [Int]()
        
        for number in 1...100 {
            numberArray.append(number)
        }
       
        let randomNumber = numberArray.randomElement()
//        let randomNumberTwo = numberArray.randomElement()
        
        var message = ""
        let token = UserDefaults.standard.string(forKey: "token")
        
        switch randomNumber! {
            
            
        case 0...20:
            message = "Better give up."
        case 21:
            message = "🧞‍♂️CUPID DWARF FOUND!!! "
            //todo: API little man found
            if token != nil {
            sendData(token!)
            }
            showDwarf()
            
            
            
            
        case 21...40:
            message = "Go pray... to any God."
        case 41...45:
            message = "🧞‍♂️CUPID DWARF FOUND!!! "
            //todo: API little man found
            if token != nil {
                sendData(token!)
            }
            showDwarf()
        case 46...76:
            message = "Very little it might seems, there could be a chance."
        case 77:
            message = "🧞‍♂️CUPID DWARF FOUND!!! "
            //todo: API little man found
            if token != nil {
                sendData(token!)
            }
            showDwarf()
        case 78...86:
            message = "I have a good feeling about this."
        case 87:
            message = "🧞‍♂️CUPID DWARF FOUND!!! "
            //todo: API little man found
            if token != nil {
                sendData(token!)
            }
            showDwarf()
        case 88...99:
            message = "Lucky you, go send the letter now."
        case 100:
            message = "HURRAY!!! YOU ARE GONNA MAKE IT!"
            sendPAData(token!)
        default:
            break
        }
       
        let alert = UIAlertController(title: "Success Rate \(randomNumber!)%", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                self.dwarf.isHidden = true
        }
        )
        alert.addAction(action)
        self.present(alert, animated: true)
        

    
    }
    
    
    func sendData(_ token: String) {
        
        let userInfo: [String: String] = [
            
            "token" : token,
            "game" : "loveLetterGenerator",
            "accomplishment" : "findTheLittleMan"
            
        ]
        
        let data = try? JSONSerialization.data(withJSONObject: userInfo, options: [])
        
        if let url = URL(string: "\(api)/api/findTheLittleMan") {
            
            var request = URLRequest(url: url)
            request.httpBody = data
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                print(error?.localizedDescription)
                
                print((response as? HTTPURLResponse)?.statusCode)
               
                print(data)
               
                let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
                print(json)
                if let result = json!!["result"] {

                    print(result)

                }
                if let responseFromDwarf = json!!["response"] {

                    print(self.responseFromDwarf)

                }
                
                
                }.resume()
            
            
        }
        
        
        
        
        
    }
    
    
    
    func sendPAData(_ token: String) {
        
        let userInfo: [String: String] = [
            
            "token" : token,
            "game" : "loveLetterGenerator",
            "accomplishment" : "LuckyYou"
            
        ]
        
        let data = try? JSONSerialization.data(withJSONObject: userInfo, options: [])
        
        if let url = URL(string: "\(api)/api/personalAccomplishment") {
            
            var request = URLRequest(url: url)
            request.httpBody = data
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                print(error?.localizedDescription)
                
                print((response as? HTTPURLResponse)?.statusCode)
                //                guard let data1 = data else { return }
                print(data)
                //                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                //                print(json)
                let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
                print(json)
                if let result = json!!["result"] {
                    print(result)
                    
                }
                if let response = json!!["response"] {
                    print(response)
                }
                }.resume()
        }
    }
    
    func showDwarf() {
        dwarf.isHidden = false
        
    }
    @IBAction func showGreen(_ sender: UIButton) {
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
    
    

    //    func rainHeart() {
//        let emitter = CAEmitterLayer()
//        emitter.emitterPosition = CGPoint(x: view.frame.width / 2, y: 0)
//        emitter.emitterSize = CGSize(width: view.frame.width, height: 2)
//        view.layer.addSublayer(emitter)
//    }


}
