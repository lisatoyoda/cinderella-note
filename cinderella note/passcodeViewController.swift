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
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    
    @IBOutlet  var registerButton: UIButton!
    var pinNumber = [Int]()
    let saveData: UserDefaults = UserDefaults.standard
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if saveData.object(forKey: "pinNumber") != nil {
            pinNumber = saveData.object(forKey: "pinNumber") as![Int]
            print("パスコード\(pinNumber)")
            registerButton.setTitle("パスコードの変更はこちら", for: .normal)
        } else {
            //パスコードがない時
            print("パスコードを登録してください")
            registerButton.setTitle("パスコードの設定はこちら", for: .normal)
        }
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
        
      
        
        let borderColor = UIColor(red:255/255, green: 0.0/255, blue: 0.0/255, alpha: 1.0).cgColor
        numberLabel.layer.borderColor = borderColor
        numberLabel.layer.borderWidth = 1
    
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 画面の縦横のサイズ
        width = UIScreen.main.bounds.size.width
        height = UIScreen.main.bounds.size.height
        return CGSize(width: self.width/3.2, height: self.height/9)
    }
//    タップされた時
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          print("\(indexPath.row)のセルを押しました")
          // パスコードが4桁以上になるのを防ぐ
          if inputNumber.count < 3 {
              tapNumber(cellNum: indexPath.row)
              imageChange()
            
          } else if inputNumber.count == 3 {
              print("4桁になった")
              tapNumber(cellNum: indexPath.row)
              imageChange()

              if inputNumber.count == 4 {
                  if inputNumber == pinNumber {
                      // 入力がパスコードと一致している時、アプリのメイン画面へ。
                      // segueのidを"toMain"にしておく
                      performSegue(withIdentifier: "toMain", sender: nil)
                  } else {
                      // 入力がパスコードと一致していない時
                      print("パスコードが異なっています")
                      // アラートの表示
                      let alert: UIAlertController = UIAlertController(title: "パスコードが異なっています", message: "パスコードが異なっています。再度入力してください。",preferredStyle: .alert)
                      alert.addAction(
                          UIAlertAction(
                              title: "OK",

                              style: .default,
                              handler: { action in
                                  // OKを押した時、inputNumberの中身を全て削除し、はじめから入力してもらう
                                  self.navigationController?.popViewController(animated: true)
                                  print("OKボタンが押されました！")
                                  self.inputNumber.removeAll()
                                  self.imageChange()
                              }
                          )
                      )
                      present(alert, animated: true, completion: nil)
                  }
              }
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
            if inputNumber.count>0 {
                inputNumber.removeLast()
            }
            else{
                print("中身がありません")
            }
            
            inputNumber.removeLast()
        }
        print(inputNumber)
    }
    func imageChange() {
        if inputNumber.count == 0 {
            image1.image = UIImage(named: "lockgray.png")
            image2.image = UIImage(named: "lockgray.png")
            image3.image = UIImage(named: "lockgray.png")
            image4.image = UIImage(named: "lockgray.png")
        } else if inputNumber.count == 1 {
            image1.image = UIImage(named: "lockblue.png")
            image2.image = UIImage(named: "lockgray.png")
            image3.image = UIImage(named: "lockgray.png")
            image4.image = UIImage(named: "lockgray.png")
        } else if inputNumber.count == 2 {
            image1.image = UIImage(named: "lockblue.png")
            image2.image = UIImage(named:"lockblue.png")
            image3.image = UIImage(named: "lockgray.png")
            image4.image = UIImage(named: "lockgray.png")
        } else if inputNumber.count == 3 {
            image1.image = UIImage(named: "lockblue.png")
            image2.image = UIImage(named: "lockblue.png")
            image3.image = UIImage(named: "lockblue.png")
            image4.image = UIImage(named: "lockgray.png")
        } else if inputNumber.count == 4 {
            image1.image = UIImage(named: "lockblue.png")
            image2.image = UIImage(named: "lockblue.png")
            image3.image = UIImage(named: "lockblue.png")
            image4.image = UIImage(named: "lockblue.png")
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
}
