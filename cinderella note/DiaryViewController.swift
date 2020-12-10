//
//  DaiaryViewController.swift
//  cinderella note
//
//  Created by 豊田莉彩 on 2020/11/12.
//  Copyright © 2020 豊田莉彩. All rights reserved.
//

import UIKit

class DiaryViewController: UIViewController {
    
    var date = Date()
    var selectedDay: String = ""
    let dateFormatter = DateFormatter()
    
    @IBOutlet var DiaryTextView: UITextView!
    @IBOutlet var selectedDaylabel: UILabel!
    
    //ユーザーデフォルトにアクセス
    var saveData: UserDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swiped(_:)))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swiped(_:)))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)
        
        func didSwipe(sender: UISwipeGestureRecognizer) {
            if sender.direction == .right {
                print("right")
            }
            else if sender.direction == .left {
                print("left")
            }
        }
        
        
        
        DiaryTextView.text = saveData.object(forKey: selectedDay + "diary") as? String
        
        
        dateFormatter.dateFormat = "yyyy/MM/dd"
        selectedDay = dateFormatter.string(from: date)
        selectedDaylabel.text = selectedDay
        print(selectedDay)
        
        // Do any additional setup after loading the view.
        
    }
    
    
    @objc func swiped(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .left:
            print("swiped left")
            nextDay()
        case .right:
            print("swiped right")
            previousDay()
        default:
            break
        }
        
        
    }
    
    @objc func nextDay() {
        //１日後にする
        date = Date (timeInterval: 60*60*24, since: date)
        selectedDay = dateFormatter.string(from: date)
        selectedDaylabel.text = selectedDay
        DiaryTextView.text = saveData.object(forKey: selectedDay + "diary") as? String
        
    }
    
    @objc func previousDay() {
        date = Date (timeInterval: -60*60*24, since: date)
        selectedDay = dateFormatter.string(from: date)
        selectedDaylabel.text = selectedDay
        DiaryTextView.text = saveData.object(forKey: selectedDay + "diary") as? String
    }
    
    @IBAction func saveButton() {
        //savedateにセットする
        saveData.set(DiaryTextView.text, forKey: selectedDay + "diary")
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


