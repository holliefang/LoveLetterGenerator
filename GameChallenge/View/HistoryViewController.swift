//
//  HistoryViewController.swift
//  GameChallenge
//
//  Created by Sihan Fang on 2018/12/17.
//  Copyright © 2018 Sihan Fang. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    
    var purchaseCount = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
}

extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purchaseCount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(purchaseCount)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
//        let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        
        cell.textLabel?.text = purchaseCount[indexPath.row]
        
        return cell
    }
    
    
}

