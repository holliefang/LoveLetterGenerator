//
//  StoreViewController.swift
//  GameChallenge
//
//  Created by Sihan Fang on 2018/12/19.
//  Copyright © 2018 Sihan Fang. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    var isAvailaible = ""
    
    
    
    @IBAction func soldOut(_ sender: Any) {
        showSoldAlert()
        
    }

    
    
    @IBAction func sellItem(_ sender: Any) {
        showSellItem()
    
    }
    @IBAction func soldOutToo(_ sender: Any) {
        showSoldAlert()

    }
    
    

    func showSoldAlert() {
        
        let alert = UIAlertController(title: "Sorry!", message: "We are sold out.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK...", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    func showSellItem() {
    
        let alert = UIAlertController(title: "$100 Green", message: "Do you want to buy it?", preferredStyle: .alert)
        let action = UIAlertAction(title: "No, thanks", style: .default, handler: nil)
        let buyAction = UIAlertAction(title: "Sure", style: .default) { (action) in
           
            var savedToken = ""
            
            if let token = UserDefaults.standard.string(forKey: "token") {
                savedToken = token
            }
            
            print("=====did buy=====")
            self.buyItem(savedToken)
        }
        alert.addAction(action)
        alert.addAction(buyAction)
        self.present(alert, animated: true)
    }
    
    func buyItem(_ token: String) {
        
        print("=============================")
        
        let myToken: [String: String] = [
            "token": token,
            "id": "2",
            ]
        
        let data = try? JSONSerialization.data(withJSONObject: myToken, options: [])
        if let url = URL(string: "\(api)/api/purchase") {
            var request = URLRequest(url: url)
            request.httpBody = data
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                print(error?.localizedDescription)
                print((response as? HTTPURLResponse)?.statusCode)
                
                if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any] {
                    print(json)
                    if let response = json?["response"] {
                        print("Are you there？")
                        print(response)
                    }
                    if let remainingPoint = json?["remainingPoints"] {
                        print(remainingPoint)
                        print("-------------------")
                    }
                    if let isAvailaible = json?["result"] as? String{
                        print(isAvailaible)
                        self.isAvailaible = isAvailaible
                        
                        UserDefaults.standard.set(isAvailaible, forKey: "isAvailaibel")
                    }
                }
            }.resume()
            
         
            
        }
    }
}
