//
//  myRuleViewController.swift
//  cinderella note
//
//  Created by 豊田莉彩 on 2020/12/17.
//  Copyright © 2020 豊田莉彩. All rights reserved.
//

import UIKit

class myRuleViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{
    
    @IBOutlet var table : UITableView!
    var ruleViewController = RuleViewController()
    var RuleArray: [String] = []
    let saveData:UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 余分なセルを描画しないようにする
        table.tableFooterView = UIView()
        
        if saveData.object(forKey:"rulesave") != nil
        {
    
        RuleArray = saveData.object(forKey:"rulesave") as! [String]
    
        }
        table.dataSource = self
        
        table.delegate = self
        
    }
    func tableView(_ tableView:UITableView,numberOfRowsInSection section: Int) -> Int {
        return RuleArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = RuleArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView:UITableView, didSelectRowAt indexPath: IndexPath) {
        if RuleArray[indexPath.row] == "日記" {
            self.performSegue(withIdentifier: "toDiary", sender: nil)
        }
        print(indexPath.row)
    }
    
    
    
    // Do any additional setup after loading the view.
    
    
}
