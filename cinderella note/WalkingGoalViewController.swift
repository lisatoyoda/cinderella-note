//
//  WalkingGoalViewController.swift
//  cinderella note
//
//  Created by 豊田莉彩 on 2021/01/28.
//  Copyright © 2021 豊田莉彩. All rights reserved.
//

import UIKit

class WalkingGoalViewController: UIViewController {
    
    
    let saveData: UserDefaults = UserDefaults.standard
    var WalkingGoal: Int = 0
    @IBOutlet var WalkingGoalTextField: UITextField!
    
    
    @IBAction func saveGoal() {
        if WalkingGoalTextField.text != nil {
            WalkingGoal = Int(WalkingGoalTextField.text!)!
            
            
        }
        saveData.set(WalkingGoal,forKey:"goalsave")
        self.dismiss(animated: true, completion: nil)
        
        
        
    }
    
    override func viewDidLoad() {
        
        // Do any additional setup after loading the view.
        // すでに目標が設定されていたらそれを表示
        if saveData.object(forKey: "goalsave") != nil {
            WalkingGoal = saveData.object(forKey: "goalsave") as! Int
            WalkingGoalTextField.text = String(WalkingGoal)
            self.WalkingGoalTextField.keyboardType = UIKeyboardType.numberPad
        }
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
