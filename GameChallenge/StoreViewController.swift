//
//  StoreViewController.swift
//  GameChallenge
//
//  Created by Sihan Fang on 2018/12/19.
//  Copyright © 2018 Sihan Fang. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var storeArray: [String] = ["1"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

extension StoreViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = storeArray[indexPath.row]
        return cell!

    }


}
