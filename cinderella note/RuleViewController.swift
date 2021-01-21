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
    @IBOutlet var checklabel4 : UILabel!
    @IBOutlet var checklabel5 : UILabel!
    
    
    @IBOutlet var finishbutton1 : UIButton!
    @IBOutlet var finishbutton2: UIButton!
    @IBOutlet var finishbutton3: UIButton!
    @IBOutlet var finishbutton4: UIButton!
    @IBOutlet var finishbutton5: UIButton!
    
    var plan1: Int = 0
    var plan2: Int = 0
    var plan3: Int = 0
    var plan4: Int = 0
    var plan5: Int = 0
    var RuleArray: [String] = []
    let saveData: UserDefaults = UserDefaults.standard
    
    @IBAction func push1() {
        if plan1 == 0 {
            plan1 = 1
            finishbutton1.setBackgroundImage(UIImage(named: "checkMark.jpg"), for: .normal)
            print("食事が押された")
            RuleArray.append("食事")
            //            print("食事押した")
            print(RuleArray)
            
        } else {
            plan1 = 0
            finishbutton1.setBackgroundImage(nil, for: .normal)
            RuleArray.removeAll(where: {$0 == "食事"})
            print(RuleArray)
        }
        saveData.set(RuleArray,forKey:"rulesave")
    }
    
    @IBAction func push2() {
        if plan2 == 0 {
            plan2 = 1
            finishbutton2.setBackgroundImage(UIImage(named: "checkMark.jpg"), for: .normal)
            print("睡眠が押された")
            RuleArray.append("睡眠")
            //            print("睡眠押した")
            print(RuleArray)
            
            
        } else {
            plan2 = 0
            finishbutton2.setBackgroundImage(nil, for: .normal)
            RuleArray.removeAll(where: {$0 == "睡眠"})
            print(RuleArray)
        }
        saveData.set(RuleArray,forKey:"rulesave")
    }
    
    
    @IBAction func push3() {
        if plan3 == 0 {
            plan3 = 1
            finishbutton3.setBackgroundImage(UIImage(named: "checkMark.jpg"), for: .normal)
            //            print("睡眠がおした")
            RuleArray.append("ウォーキング")
            
            print(RuleArray)
            
        } else {
            plan3 = 0
            finishbutton3.setBackgroundImage(nil, for: .normal)
            RuleArray.removeAll(where: {$0 == "ウォーキング"})
            print(RuleArray)
        }
        saveData.set(RuleArray,forKey:"rulesave")
    }
    
    
    @IBAction func push4() {
        if plan4 == 0 {
            plan4 = 1
            finishbutton4.setBackgroundImage(UIImage(named: "checkMark.jpg"), for: .normal)
            print("日記が押された")
            RuleArray.append("日記")
            //            print("日記押した")
            print(RuleArray)
            
        } else {
            plan4 = 0
            finishbutton4.setBackgroundImage(nil, for: .normal)
            RuleArray.removeAll(where: {$0 == "日記"})
            print(RuleArray)
        }
        saveData.set(RuleArray,forKey:"rulesave")
    }
    
    
    @IBAction func push5() {
        if plan5 == 0 {
            plan5 = 1
            finishbutton5.setBackgroundImage(UIImage(named: "checkMark.jpg"), for: .normal)
            print("その他が押された")
            RuleArray.append("その他")
            //            print("日記押した")
            print(RuleArray)
            
        } else {
            plan5 = 0
            finishbutton5.setBackgroundImage(nil, for: .normal)
            RuleArray.removeAll(where: {$0 == "その他"})
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
