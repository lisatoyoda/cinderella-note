//
//  SetLockNumberViewController.swift
//  cinderella note
//
//  Created by 豊田莉彩 on 2020/09/03.
//  Copyright © 2020 豊田莉彩. All rights reserved.
//

import UIKit

class SetLockNumberViewController: UIViewController {
    @IBOutlet var textfield: UITextField!
    @IBOutlet var button : UIButton!
    let saveData : UserDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func savenumber () {
        saveData.set(textfield.text, forKey: "locknumber") as! String
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
