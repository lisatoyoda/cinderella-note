//
//  passcodeViewController.swift
//  cinderella note
//
//  Created by 豊田莉彩 on 2021/02/18.
//  Copyright © 2021 豊田莉彩. All rights reserved.
//

import UIKit

class passcodeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    var width: CGFloat!
    var height: CGFloat!
    
    var numbers = ["1","2","3","4","5","6","7","8","9","","0","Del"]
    
    var inputNumber = [Int]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // Do any additional setup after loading the view.
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let numberLabel = cell.contentView.viewWithTag(1) as! UILabel
        numberLabel.text = numbers[indexPath.row]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 画面の縦横のサイズ
        width = UIScreen.main.bounds.size.width
        height = UIScreen.main.bounds.size.height
        return CGSize(width: self.width/3.2, height: self.height/9)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.row)のセルを押しました")
        
        if inputNumber.count < 3 {
                   tapNumber(cellNum: indexPath.row)
               } else if inputNumber.count == 3 {
                   print("4桁になった")
                   tapNumber(cellNum: indexPath.row)
               }
    }
    
    func tapNumber(cellNum: Int) {
           if cellNum == 0 {
               inputNumber.append(1)
           }
           if cellNum == 1 {
               inputNumber.append(2)
           }
           if cellNum == 2 {
               inputNumber.append(3)
           }
           if cellNum == 3 {
               inputNumber.append(4)
           }
           if cellNum == 4 {
               inputNumber.append(5)
           }
           if cellNum == 5 {
               inputNumber.append(6)
           }
           if cellNum == 6 {
               inputNumber.append(7)
           }
           if cellNum == 7 {
               inputNumber.append(8)
           }
           if cellNum == 8 {
               inputNumber.append(9)
           }
           if cellNum == 9 {
              
           }
           if cellNum == 10 {
               inputNumber.append(0)
           }
           if cellNum == 11 {
          
               inputNumber.removeLast()
           }
           print(inputNumber)
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
