//
//  ViewController.swift
//  original app
//
//  Created by Kenji Kobayashi on 2017/06/01.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let photos = ["instagram", "Twitter_logo_blue-1"]
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        if timer.isValid {
            timer.invalidate()
            //   saveData.set(TwitterLabel.text, forKey: "time")
            saveData.synchronize()
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(self.stopTimer(notification:)), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
        //        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.schemebtn()
    }
    
    
    var count = 0
    var timer = Timer()
    
    let saveData: UserDefaults = UserDefaults.standard
    
    
    
    
    func schemebtn() {
        let url = URL(string: "com.atebits.Tweetie2://")!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.openURL(url)
        }
        if !timer.isValid {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(self.up),
                userInfo: nil,
                repeats: true )
        }
    }
    func up() {
        count = count + 1
        //   TwitterLabel.text = String(count)
    }
    
    
    
    
    
    
    func stopTimer(notification: Notification) {
        print(timer.isValid)
        if timer.isValid {
            timer.invalidate()
            //saveData.set(TwitterLabel.text, forKey: "time")
            saveData.synchronize()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let TestCell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let imageView = TestCell.contentView.viewWithTag(4)as! UIImageView
        let cellImage = UIImage(named: photos[(indexPath as NSIndexPath).row])
        imageView.image = cellImage
        
        let label = TestCell.contentView.viewWithTag(1)as! UILabel
        label.text = photos[(indexPath as NSIndexPath).row]
        
        let totallabel = TestCell.contentView.viewWithTag(3)as! UILabel
        if totallabel.text != nil {
            totallabel.text = saveData.object(forKey: "time") as! String?
        } else {
            totallabel.text = "0"
        }
        
        return TestCell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2;
    }
    



    
    // Screenサイズに応じたセルサイズを返す
    // UICollectionViewDelegateFlowLayoutの設定が必要
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize:CGFloat = self.view.frame.size.width/2-2
        // 正方形で返すためにwidth,heightを同じにする
        return CGSize(width: cellSize, height: cellSize+50)
    }
    
    
    

    
}

