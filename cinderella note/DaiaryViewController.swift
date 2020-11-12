//
//  DaiaryViewController.swift
//  cinderella note
//
//  Created by 豊田莉彩 on 2020/11/12.
//  Copyright © 2020 豊田莉彩. All rights reserved.
//

import UIKit

class DaiaryViewController: UIViewController {
    
    var dayDate = Date()
    var today: String = ""
    let dateFormatter = DateFormatter()
    
    @IBOutlet var DaiaryTextField: UITextView!
    @IBOutlet var todaylabel: UILabel!
    
    //ユーザーデフォルトにアクセス
       var saveData: UserDefaults = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    DaiaryTextField.text = saveData.object(forKey: today + "daiary") as? String
        
        
        dateFormatter.dateFormat = "yyyy/MM/dd"
        today = dateFormatter.string(from: dayDate)
        todaylabel.text = dateFormatter.string(from: dayDate)
        print(today)
        
        // Do any additional setup after loading the view.
        
    }
    

    
    @IBAction func saveButton() {
    }
    
    @IBAction func backButton() {
    }
    
    @IBAction func nextButton() {
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


