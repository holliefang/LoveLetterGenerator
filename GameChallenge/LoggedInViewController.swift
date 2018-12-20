//
//  LoggedInViewController.swift
//  GameChallenge
//
//  Created by Sihan Fang on 2018/12/18.
//  Copyright © 2018 Sihan Fang. All rights reserved.
//

import UIKit

class LoggedInViewController: UIViewController {

    @IBOutlet weak var emailTexrField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var result = ""
    var response = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logIn(_ sender: UIButton) {
        print("login")
        
        guard emailTexrField.text != "" else { return }
        guard passwordTextField.text != "" else { return }
        
        guard let email = emailTexrField.text, let password = passwordTextField.text else { return }
        
        getLoginData(email, password)
        
    }
    
    func getLoginData(_ email: String, _ password: String) {
        print("did tap get login data")
        
        let userInfo: [String: Any] = [
            
            "email" : email,
            "password" : password
            
                    ]
        
        let data = try? JSONSerialization.data(withJSONObject: userInfo, options: [])
        
        if let url = URL(string: "\(api)/api/login") {
            print("url is \(url)")
            
            var request = URLRequest(url: url)
            request.httpBody = data
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                print("url session")
                
                print(error?.localizedDescription)
                
                print((response as? HTTPURLResponse)?.statusCode)
//                guard let data1 = data else { return }
                print(data)
                //                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                //                print(json)
                let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String : String]
                print(json)
                let token = json!!["token"]
                UserDefaults.standard.set(token, forKey: "token")
                
                if let result = json!!["result"] {
                    self.result = result
                }
                if let response = json!!["response"] {
                    self.response = response
                }
                
                print(self.result)
                
                
                DispatchQueue.main.async {
                    
                
                    if self.result == "true" {
                        let alert = UIAlertController(title: "Login info", message: "\(self.response)", preferredStyle: .alert)
                        let action = UIAlertAction(title: "OK", style: .default, handler:  { (_) -> Void in
                            
                            self.navigationController?.popToRootViewController(animated: true)
                                })
                        alert.addAction(action)
                        self.present(alert, animated: true)
                    } else {
                        let alert = UIAlertController(title: "Login info", message: "\(self.response)", preferredStyle: .alert)
                        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alert.addAction(action)
                        self.present(alert, animated: true)
                        
                    }
                }
                
                }.resume()
            
            
        }
        
        
        
        
        
    }

}
