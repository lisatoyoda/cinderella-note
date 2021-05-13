//
//  SleepingViewController.swift
//  cinderella note
//
//  Created by 豊田莉彩 on 2021/05/06.
//  Copyright © 2021 豊田莉彩. All rights reserved.
//

import UIKit
import HealthKit

class SleepingViewController: UIViewController {
    
    let healthStore = HKHealthStore()
    
    
    @IBOutlet var sleepinglabel: UILabel!
    @IBAction func setgoalbutton() {
    }
    
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        let fromDate: Date = Date()-3600*24*10
        let toDate: Date = Date()
        
        let readTypes = Set([
                                HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis)!])
        healthStore.requestAuthorization(toShare: [], read: readTypes, completion: { success, error in
        
        if success == false {
            print("データにアクセスできません")
            return
        }
        })
        
        
        // 睡眠データを取得
        let query = HKSampleQuery(sampleType: HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis)!,
                                        predicate: HKQuery.predicateForSamples(withStart: fromDate, end: toDate, options: []),
                                        limit: HKObjectQueryNoLimit,
                                        sortDescriptors: [NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: true)]){ (query, results, error) in
            
            guard error == nil else { print("error"); return }
            
            if let tmpResults = results as? [HKCategorySample] {
                for item in tmpResults{
                    print(item)
                }
                // 取得したデータを格納
            }
        }
        healthStore.execute(query)
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

struct sleeptime {
    var sleeptime: TimeInterval
    var startDate: Date
    init (endDate: Date, StartDate: Date) {
        let difference = endDate.timeIntervalSince(StartDate)
        self.sleeptime = difference
        self.startDate = StartDate
    }
}
