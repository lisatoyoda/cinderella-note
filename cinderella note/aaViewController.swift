//
//  aaViewController.swift
//  cinderella note
//
//  Created by 豊田莉彩 on 2021/05/06.
//  Copyright © 2021 豊田莉彩. All rights reserved.
//

import UIKit

class aaViewController: UIViewController {
    
    let saveData: UserDefaults = UserDefaults.standard
    
    @IBOutlet var sleepingTextField: UITextField!
    @IBAction func savebutton() {
        saveData.set(sleepingTextField.text,forKey: "sleeping")
        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
