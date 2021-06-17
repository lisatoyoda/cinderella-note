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
    
    var sleepRecords = [SleepTimeItem]()
    var maxSleepTime: TimeInterval = 12 * 3600

    let healthStore = HKHealthStore()
    
    
    @IBOutlet var sleepinglabel: UILabel!
    @IBAction func setgoalbutton() {
    }
    
    
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
                   collectionView.delegate = self
                   collectionView.dataSource = self
                   self.collectionView?.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
               }
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
            // 睡眠データを取得
            let query = HKSampleQuery(sampleType: HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis)!,
                                            predicate: HKQuery.predicateForSamples(withStart: fromDate, end: toDate, options: []),
                                            limit: HKObjectQueryNoLimit,
                                            sortDescriptors: [NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: true)]){ (query, results, error) in
                
                if let _error = error {
                    print(_error)
                    return
                }
        
                if let tmpResults = results as? [HKCategorySample] {

                    for item in tmpResults {
                        let sleepItem = SleepTimeItem(endDate: item.endDate, startDate: item.startDate)
                        self.sleepRecords.append(sleepItem)
                        print(self.sleepRecords)
                    }
                    DispatchQueue.main.async {
                                            self.collectionView.reloadData()
                                        }
                }
            }
            //クエリの実行
            self.healthStore.execute(query)
        })
    }
}

struct SleepTimeItem {
    var sleepTime: TimeInterval
    var startDate: Date
    init(endDate: Date, startDate: Date) {
        self.sleepTime = endDate.timeIntervalSince(startDate)
        self.startDate = startDate
    }
}
            
extension SleepingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sleepRecords.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else { fatalError() }
        
        cell.height = CGFloat(sleepRecords[indexPath.row].sleepTime/maxSleepTime)
        cell.timeLabel.text=String(floor(sleepRecords[indexPath.row].sleepTime/3600))+"時間"
        return cell
    
    }
    
 
    

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 50, height: 240)
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

