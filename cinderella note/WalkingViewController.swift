//
//  WalkingViewController.swift
//  cinderella note
//
//  Created by 豊田莉彩 on 2020/12/10.
//  Copyright © 2020 豊田莉彩. All rights reserved.
//

import UIKit
import HealthKit

class WalkingViewController: UIViewController {
    
    @IBOutlet weak var Steps: UILabel!
    @IBOutlet var Goal: UILabel!
    
    var plan: Int = 3000
    let savedValue = UserDefaults.standard
    
    override func viewDidLoad() {
        if savedValue.object(forKey: "goalsave") != nil{
            plan = savedValue.object(forKey: "goalsave") as! Int
        }
            
        
        super.viewDidLoad()
        let readType = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        store.requestAuthorization(toShare: [], read: [readType]) { _, _ in }
        
        let calendar = Calendar(identifier: .gregorian)
        let dc = calendar.dateComponents(in: .current, from: Date())
        let startOfDate = DateComponents(calendar: calendar, timeZone: .current, year: dc.year, month: dc.month, day: dc.day).date!
        let endOfDate = calendar.date(byAdding: DateComponents(day: 1), to: startOfDate)!
        
        updateStepLabel(start: startOfDate, end: endOfDate)
        
        
      

    }
    
    @IBAction func valueChanged(_ sender: UIDatePicker) {
        let calendar = Calendar(identifier: .gregorian)
        let dc = calendar.dateComponents(in: .current, from: sender.date)
        let startOfDate = DateComponents(calendar: calendar, timeZone: .current, year: dc.year, month: dc.month, day: dc.day).date!
        let endOfDate = calendar.date(byAdding: DateComponents(day: 1), to: startOfDate)!
        
        updateStepLabel(start: startOfDate, end: endOfDate)
    }
    
    let store = HKHealthStore()
    
    
    func getCountStepUsingStatisticsQueryWithoutThirdpartyData(from start: Date, to end: Date, completion hander: @escaping (HKStatisticsQuery, HKStatistics?, Error?) -> Void) {
        let type = HKSampleType.quantityType(forIdentifier: .stepCount)!
        let datePredicate = HKQuery.predicateForSamples(withStart: start, end: end)
        let query = HKStatisticsQuery(quantityType: type, quantitySamplePredicate: datePredicate, options: .separateBySource) { (query, data, error) in
            if let sources = data?.sources?.filter({ $0.bundleIdentifier.hasPrefix("com.apple.health") }) {
                let sourcesPredicate = HKQuery.predicateForObjects(from: Set(sources))
                let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [datePredicate, sourcesPredicate])
                let query = HKStatisticsQuery(quantityType: type, quantitySamplePredicate: predicate, options: .cumulativeSum, completionHandler: hander)
                self.store.execute(query)
            }
        }
        store.execute(query)
    }
    
    
    
    
    
    func updateStepLabel(start: Date, end: Date) {
        

        
        
        getCountStepUsingStatisticsQueryWithoutThirdpartyData(from: start, to: end) { (query, statistics, error) in
            DispatchQueue.main.async {
                if let value = statistics?.sumQuantity()?.doubleValue(for: .count()) {
                    self.Steps.text = "\(Int(value)) steps"
                    self.Goal.text = "目標まであと\(self.plan - Int(value))歩"
                } else {
                    self.Steps.text = "nil"
                }
            }
        }
    }
}








// Do any additional setup after loading the view.



/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


