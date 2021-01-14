//
//  RuleViewController.swift
//  cinderella note
//
//  Created by 豊田莉彩 on 2020/12/17.
//  Copyright © 2020 豊田莉彩. All rights reserved.
//

import UIKit

class RuleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // Do any additional setup after loading the view.
    }
    @IBOutlet var checklabel1 : UILabel!
    @IBOutlet var checklabel2 : UILabel!
    @IBOutlet var checklabel3 : UILabel!
    
    
    @IBOutlet var finishbutton1 : UIButton!
    @IBOutlet var finishbutton2: UIButton!
    @IBOutlet var finishbutton3: UIButton!
    
    var plan1: Int = 0
    var plan2: Int = 0
    var plan3: Int = 0
    var RuleArray: [String] = []
    let saveData: UserDefaults = UserDefaults.standard
    
    @IBAction func push1() {
        if plan1 == 0 {
            plan1 = 1
            finishbutton1.setBackgroundImage(UIImage(named: "checkMark.jpg"), for: .normal)
            print("ルール１を押す")
            RuleArray.append("日記")
            //            print("日記押した")
            print(RuleArray)
            
        } else {
            plan1 = 0
            finishbutton1.setBackgroundImage(nil, for: .normal)
            RuleArray.removeAll(where: {$0 == "日記"})
            print(RuleArray)
        }
        saveData.set(RuleArray,forKey:"rulesave")
    }
    
    @IBAction func push2() {
        if plan2 == 0 {
            plan2 = 1
            finishbutton2.setBackgroundImage(UIImage(named: "checkMark.jpg"), for: .normal)
            print("ルール２おした")
            RuleArray.append("歩数")
            //            print("歩数押した")
            print(RuleArray)
            
            
        } else {
            plan2 = 0
            finishbutton2.setBackgroundImage(nil, for: .normal)
            RuleArray.removeAll(where: {$0 == "歩数"})
            print(RuleArray)
        }
        saveData.set(RuleArray,forKey:"rulesave")
    }
    
    
    @IBAction func push3() {
        if plan3 == 0 {
            plan3 = 1
            finishbutton3.setBackgroundImage(UIImage(named: "checkMark.jpg"), for: .normal)
            //            print("ルール３おした")
            RuleArray.append("睡眠")
            
            print(RuleArray)
            
        } else {
            plan3 = 0
            finishbutton3.setBackgroundImage(nil, for: .normal)
            RuleArray.removeAll(where: {$0 == "睡眠"})
            print(RuleArray)
        }
        saveData.set(RuleArray,forKey:"rulesave")
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
