//
//  APIFunction.swift
//  GameChallenge
//
//  Created by Sihan Fang on 2018/12/18.
//  Copyright © 2018 Sihan Fang. All rights reserved.
//

import Foundation

class API{
    static var apiUrl : String {get{return "http://1a77a175.ngrok.io/api/"}}
    
    enum requestType:String {
        case 註冊         = "register"
        case 登入         = "login"
        case 找到小矮人    = "findTheLittleMan"
        case 個人資料區    = "profile"
        case 扣點數         = "deduction"
//        case 儲值成就        = ""
    }
    static func signUp(account:String,password:String,password_confirmation:String)    ->(Bool, String) {
        let data: [String: String] = [
            "email" : account,
            "password" : password,
            "password_confirmation" : password_confirmation
        ]
        return sentRequest(info: data, type: .註冊)
    }
    static func logIn(account:String,password:String)                                ->(Bool, String) {
        let data: [String: String] = ["email" : account,"password" : password]
        return sentRequest(info: data, type: .登入)
        
    }
    static func forTheDwarf(token:String)                                            ->(Bool, String) {
        let data = ["token": token,
                    "game": "loveLetterGenerator",
                    "accomplishment": "findTheLittleMan"]
        return sentRequest(info: data, type: .找到小矮人)
    }
    static func forProfile(token:String)                                            ->(Bool, String) {
        let data = ["token":token]
        return sentRequest(info: data, type: .個人資料區)
    }
    static func forDeduction(token:String)                                            ->(Bool, String) {
        let data = ["token":token]
        return sentRequest(info: data, type: .扣點數)
        
    }
    
    private class func sentRequest(info:[String:String], type:API.requestType)        ->(Bool, String) {
        let data = try? JSONSerialization.data(withJSONObject: info, options: [])
        var re = (false, "")
        if let url = URL(string: API.apiUrl + type.rawValue) {
            var request = URLRequest(url: url)
            request.httpBody = data
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                print(error?.localizedDescription)
                print(data)
                print((response as? HTTPURLResponse)?.statusCode)
                guard let data1 = data else { return }
                //                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                //                print(json)
                let json = try? JSONSerialization.jsonObject(with: data1, options: []) as? [String:String]
                print(json)
                let bool = ((json??["result"]) == "true") ? true:false
                let str = json??["response"] ?? ""
                re = (bool, str)
                }.resume()
        }
        return re
    }
}


