//
//  myRuleViewController.swift
//  cinderella note
//
//  Created by 豊田莉彩 on 2020/12/17.
//  Copyright © 2020 豊田莉彩. All rights reserved.
//

import UIKit

class myRuleViewController: UIViewController , UITableViewDataSource {
    
    @IBOutlet var table : UITableView!
    var ruleViewController = RuleViewController()
    var RuleArray: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        
    }
    func tableView(_ tableView:UITableView,numberOfRowsInSection section: Int) -> Int {
        return RuleArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = RuleArray[indexPath.row]
        return cell!
    }
    
    
    
    
    // Do any additional setup after loading the view.
    
    
}
