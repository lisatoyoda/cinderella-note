//
//  MealViewController.swift
//  cinderella note
//
//  Created by 豊田莉彩 on 2020/11/05.
//  Copyright © 2020 豊田莉彩. All rights reserved.
//

import UIKit
import Foundation

class MealViewController: UIViewController {
    
    @IBOutlet var breakfastTextField: UITextField!
    @IBOutlet var lunchTextField: UITextField!
    @IBOutlet var supperTextField: UITextField!
    @IBOutlet var oyatsuTextField: UITextField!
    @IBOutlet var selectedDaylabel: UILabel!
    
    var date = Date()
    var selectedDay: String = ""
    let dateFormatter = DateFormatter()
    
    
    //ユーザーデフォルトにアクセス
    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
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
        
        dateFormatter.dateFormat = "yyyy/MM/dd"
        selectedDay = dateFormatter.string(from: date)
        selectedDaylabel.text = selectedDay
        print(selectedDay)
        
        //keyを使って呼び出すコード
        breakfastTextField.text = saveData.object(forKey: selectedDay + "breakfast") as? String
        lunchTextField.text = saveData.object(forKey: selectedDay + "lunch") as? String
        supperTextField.text = saveData.object(forKey: selectedDay + "supper") as? String
        
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
        breakfastTextField.text = saveData.object(forKey: selectedDay + "breakfast") as? String
        lunchTextField.text = saveData.object(forKey: selectedDay + "lunch") as? String
        supperTextField.text = saveData.object(forKey: selectedDay + "supper") as? String
        
    }
    
    @objc func previousDay() {
        date = Date (timeInterval: -60*60*24, since: date)
        selectedDay = dateFormatter.string(from: date)
        selectedDaylabel.text = selectedDay
        breakfastTextField.text = saveData.object(forKey: selectedDay + "breakfast") as? String
        lunchTextField.text = saveData.object(forKey: selectedDay + "lunch") as? String
        supperTextField.text = saveData.object(forKey: selectedDay + "supper") as? String
        
    }
    
    
    @IBAction func saveMeal() {
        //        dayDate = Calender.current.date(byAdding: .dayDate, value: -1, to: dayDate)!
        //savedateにセットする
        saveData.set(breakfastTextField.text, forKey: selectedDay + "breakfast")
        saveData.set(lunchTextField.text, forKey: selectedDay + "lunch")
        saveData.set(supperTextField.text, forKey: selectedDay + "supper")
        saveData.set(oyatsuTextField.text, forKey: selectedDay + "oyatsu")
        
        
        
        
    }
    
//    @IBAction func back() {
//        
//        breakfastTextField.text = saveData.object(forKey: "20201111" + "breakfast") as? String
//        lunchTextField.text = saveData.object(forKey: "20201111" + "lunch") as? String
//        supperTextField.text = saveData.object(forKey: "20201111" + "supper") as? String
//        oyatsuTextField.text = saveData.object(forKey: "20201111" + "oyatsu") as? String
//    }
//    
//    
//    
//    @IBAction func next() {
//        breakfastTextField.text = saveData.object(forKey: "20201113" + "breakfast") as? String
//        lunchTextField.text = saveData.object(forKey: "20201113" + "lunch") as? String
//        supperTextField.text = saveData.object(forKey: "20201113" + "supper") as? String
//        oyatsuTextField.text = saveData.object(forKey: "20201113" + "oyatsu") as? String
//        
//    }
//    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
