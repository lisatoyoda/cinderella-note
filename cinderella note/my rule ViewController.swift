//
//  my rule ViewController.swift
//  cinderella note
//
//  Created by 豊田莉彩 on 2020/09/03.
//  Copyright © 2020 豊田莉彩. All rights reserved.
//

import UIKit

class my_rule_ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // Do any additional setup after loading the view.
    }
    @IBOutlet var checklabel : UILabel!
    @IBOutlet var finishbutton : UIButton!
    var plan1: Int = 0
    
    @IBAction func push() {
        if plan1 == 0 {
            plan1 = 1
            finishbutton.setImage(UIImage(named: "checkMark.jpg"), for: .normal)
            print("ちぇっくぼたんおした")
            
        } else {
            plan1 = 0
            finishbutton.setImage(nil, for: .normal)
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
