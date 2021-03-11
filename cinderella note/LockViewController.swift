//
//  LockViewController.swift
//  cinderella note
//
//  Created by 豊田莉彩 on 2020/09/03.
//  Copyright © 2020 豊田莉彩. All rights reserved.
//

import UIKit

class LockViewController: UIViewController {
    
  
    @IBOutlet var locknumber : UITextField!
    @IBOutlet var okbutton : UIButton!
    let saveData: UserDefaults = UserDefaults.standard
    var savedlocknumber :Int!
    var setNumber: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNumber = saveData.object(forKey: "setNumber") as! String
        if setNumber != "true" {
            self.performSegue(withIdentifier: "tosetnumber", sender: nil)
        }
        savedlocknumber = saveData.object(forKey: "locknumber") as! Int
        // Do any additional setup after loading the view.
    }
    
    @IBAction func releaseButton() {
        if locknumber.text == "unlock" {
            self.performSegue(withIdentifier: "toMain", sender: nil)
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
