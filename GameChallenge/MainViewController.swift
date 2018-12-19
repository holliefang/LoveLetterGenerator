//
//  MainViewController.swift
//  GameChallenge
//
//  Created by Sihan Fang on 2018/12/17.
//  Copyright © 2018 Sihan Fang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var usernameLbl: UILabel!
    

    var purchaseCount: [String] = []
    var remainingPoint = 0
    var username = ""


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        var savedToken = ""
        
        if let token = UserDefaults.standard.string(forKey: "token") {
            savedToken = token
        }
        
        if savedToken != "" {
        showUserInfo(savedToken)
        } else {
        print("not logged in")
        }
        
        loginStatusChecked(savedToken)
            }
    
    @IBAction func start(_ sender: UIButton) {
        
        var savedToken = ""
        
        if let token = UserDefaults.standard.string(forKey: "token") {
            savedToken = token
        }
        
        
        deduction(savedToken)

        
//        UserDefaults.standard.set(remainingPoint, forKey: "CoinNumber")
//        UserDefaults.standard.set(purchaseCount, forKey: "SavedHistory")
//        print(purchaseCount)
        

    }
    
    
    
    @IBAction func historyTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "ToHistorySegue", sender: sender)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? HistoryViewController
        vc?.purchaseCount = UserDefaults.standard.value(forKey: "SavedHistory") as! [String]
        
    }
    
    func deduction(_ token: String) {
        
        let myToken = [ "token": token,
                        "game": "loveLetterGenerator"
                    ]
        
        let data = try? JSONSerialization.data(withJSONObject: myToken, options: [])
        
        if let url = URL(string: "http://b8069abb.ngrok.io/api/deduction") {
            
            var request = URLRequest(url: url)
            request.httpBody = data
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                print(error?.localizedDescription)
                
                print((response as? HTTPURLResponse)?.statusCode)
                print(data)
                print("---------=-=-=-====-=-=-=-=-=-=-=-=-=====----===---=-==-=-=--==-=-")

                let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
                 if let moneyleft = json!!["response"] as? Int {
                    
//                    let pontRemainning = Int(moneyleft)
                    print("moneyleft:\(moneyleft)")
//                    print("pointRemaining: \(pointRemainning)")
                    print("HAHAHAHAHHAHAHAHSHOW ME Who you are")
                }
            
                print(json)

                }.resume()
        }
    }
    
    func showUserInfo (_ token: String) {
        
        let myToken: [String: String] = [
            "token" : token,
            "game": "loveLetterGenerator"
        ]
        
        let data = try? JSONSerialization.data(withJSONObject: myToken, options: [])
        
        if let url = URL(string: "http://b8069abb.ngrok.io/api/profile") {
            
            var request = URLRequest(url: url)
            request.httpBody = data
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                print(error?.localizedDescription)
                
                print((response as? HTTPURLResponse)?.statusCode)
                
                if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any] {
                    print(json)
                    if let responseData = json?["response"] as? [String: Any]  {
                        
                        if let remainingPoint = responseData["RemainingPoint"] as? Int {
                            self.remainingPoint = remainingPoint
                            print(remainingPoint)
                            
                        }
                        if let email = responseData["email"] as? String {
                            self.username = email
                        }
                    }
                }
        }.resume()
        }
    }
    
    func loginStatusChecked(_ token: String) {
        
        if token != "" {
            self.coinLabel.text = "♥︎\(remainingPoint)"
            self.usernameLbl.text = "Hello, \(self.username)♥︎"
            usernameLbl.isHidden = false
            
            if remainingPoint < 10 {
                startBtn.isEnabled = false
                startBtn.backgroundColor = UIColor.gray

            } else {
                startBtn.isEnabled = true
                startBtn.backgroundColor = #colorLiteral(red: 0.845177665, green: 0.4215331046, blue: 0.4057041513, alpha: 1)
            }        } else {
            remainingPoint = 0
            self.coinLabel.text = "♥︎\(remainingPoint)"
            self.usernameLbl.text = "Please login."
            
            if remainingPoint < 10 {
                startBtn.isEnabled = false
                startBtn.backgroundColor = UIColor.gray
            } else {
                startBtn.isEnabled = true
                startBtn.backgroundColor = #colorLiteral(red: 0.845177665, green: 0.4215331046, blue: 0.4057041513, alpha: 1)

            }
        }
    }
    
    func seeItem(_ token: String) {
        let myToken: [String: String] = [
        "token": token,
        "game": "loveLetterGenerator",
        ]
        
        let data = try? JSONSerialization.data(withJSONObject: myToken, options: [])
        if let url = URL(string: "http://b8069abb.ngrok.io/api/items") {
            var request = URLRequest(url: url)
            request.httpBody = data
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                print(error?.localizedDescription)
                print((response as? HTTPURLResponse)?.statusCode)
            }
            
            if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any] {
                print(json)
                if let response = json?["response"] {
                    print(response)
                }
            }
        
        }
    }
    
    func buyItem(_ token: String) {
        let myToken: [String: String] = [
            "token": token,
            "id": "1",
            ]
        
        let data = try? JSONSerialization.data(withJSONObject: myToken, options: [])
        if let url = URL(string: "http://b8069abb.ngrok.io/api/purchase") {
            var request = URLRequest(url: url)
            request.httpBody = data
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                print(error?.localizedDescription)
                print((response as? HTTPURLResponse)?.statusCode)
            }
            
            if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any] {
                print(json)
                if let response = json?["response"] {
                    print(response)
                }
            }
            
        }
    }
    
    func recordPoint() {
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        let record = formatter.string(from: Date())
        
        purchaseCount.insert("\(remainingPoint), \(record)", at: 0)

    }
    
}
