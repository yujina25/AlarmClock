//
//  ViewController.swift
//  AlarmClock
//
//  Created by 이유진 on 2022/05/07.
//

import UIKit

class ViewController: UIViewController {

    let timeSelector:Selector = #selector(ViewController.updateTime)
    
    let interval = 1.0
    var count = 0
    
    var alarmTime:String?
    
    @IBOutlet var IblCurrentTime: UILabel!
    @IBOutlet var IblAlarmTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func setDateAndTime(_ sender: UIDatePicker) {
        let pickTime = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        IblAlarmTime.text = "알람시간 : " + formatter.string(from: pickTime.date)
        
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: pickTime.date)
        
    }
    
    @objc func updateTime(){
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        IblCurrentTime.text = "현재시각 : " + formatter.string(from: date as Date)
        
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(from: date as Date)
        
        if(alarmTime == currentTime) {
            view.backgroundColor = UIColor.red
        } else {
            view.backgroundColor = UIColor.white
        }
    }
    
}

