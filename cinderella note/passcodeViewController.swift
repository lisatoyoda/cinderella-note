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
    
    var numbers = ["1","2","3","4","5","6","7","8","9","0","Del",]
    
    
    
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
 
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
