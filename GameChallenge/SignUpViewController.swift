//
//  SignUpViewController.swift
//  GameChallenge
//
//  Created by Sihan Fang on 2018/12/18.
//  Copyright © 2018 Sihan Fang. All rights reserved.
//

import UIKit



class SignUpViewController: UIViewController {

    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmationTextField: UITextField!
    
    var result = ""
    var response = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        
        

        
        guard accountTextField.text != "" else { return }
        guard let email = accountTextField.text else { return }
        
        guard passwordTextField.text == passwordConfirmationTextField.text
            && passwordTextField.text != "" && passwordConfirmationTextField.text != "" else { return }
        
        guard let password = passwordConfirmationTextField.text, let passwordconfirmation = passwordConfirmationTextField.text else { return }
        
        getData(email, password, passwordconfirmation)
        
        
    }
    

    func getData(_ email: String, _ password: String, _ passwordconfirmation: String) {
        let userInfo: [String: Any] = [
        
            "email" : email,
            "password" : password,
            "password_confirmation" : passwordconfirmation
        
        ]
        
        let data = try? JSONSerialization.data(withJSONObject: userInfo, options: [])
        
        if let url = URL(string: "\(api)/api/register") {
            var request = URLRequest(url: url)
            request.httpBody = data
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
        
             URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print(error.localizedDescription)
                }
                
                if let response = (response as? HTTPURLResponse)?.statusCode {
                    print(response)
                }
                
                guard let data = data else { return }
                print(data)

                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : String]
                print(json)
                
                if let result = json!!["result"] {
                    self.result = result
                }
                if let response = json!!["response"] {
                    self.response = response
                }
                
                print(self.result)
                
                
                DispatchQueue.main.async {
                    
                    
                    if self.result == "true" {
                        let alert = UIAlertController(title: "Register info", message: "\(self.response)", preferredStyle: .alert)
                        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alert.addAction(action)
                        self.present(alert, animated: true)
                    } else {
                        let alert = UIAlertController(title: "Register info", message: "\(self.response)", preferredStyle: .alert)
                        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alert.addAction(action)
                        self.present(alert, animated: true)
                        
                    }
                }

                
                
                
                
            }.resume()
        }
    }
    
    

    
    
}
