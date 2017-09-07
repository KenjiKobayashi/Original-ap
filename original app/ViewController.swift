//
//  ViewController.swift
//  original app
//
//  Created by Kenji Kobayashi on 2017/06/01.
//  Copyright © 2017年 mycompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let TestCell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let imageView = TestCell.contentView.viewWithTag(4)as! UIImageView
        let cellImage = UIImage(named: photos[(indexPath as NSIndexPath).row])
        imageView.image = cellImage
//        
//        let label = TestCell.contentView.viewWithTag(
    }


    
    var count = 0
    var timer = Timer()
    @IBOutlet var TwitterLabel: UILabel!
    let saveData: UserDefaults = UserDefaults.standard
    
    @IBOutlet var totallabel: UILabel!
  
    
    @IBAction func schemebtn() {
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
        TwitterLabel.text = String(count)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        if timer.isValid {
//            timer.invalidate()
//            saveData.set(TwitterLabel.text, forKey: "time")
//            saveData.synchronize()
//        }
//    }
//    




    override func viewDidLoad() {
        super.viewDidLoad()
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(self.stopTimer(notification:)), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
        // Do any additional setup after loading the view, typically from a nib.
        totallabel.text = saveData.object(forKey: "time") as! String?
    }
    
    func stopTimer(notification: Notification) {
        print(timer.isValid)
        if timer.isValid {
            timer.invalidate()
            saveData.set(TwitterLabel.text, forKey: "time")
            saveData.synchronize()
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

