//
//  ViewController.swift
//  DemoTabList
//
//  Created by Khuat Van Dung on 8/24/17.
//  Copyright © 2017 Khuat Van Dung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var month : [String] = ["","01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12",""]
    @IBOutlet weak var lbNextMonth: UILabel!
    @IBOutlet weak var lbPreveousMonth: UILabel!
    @IBOutlet weak var lbCurrentMonth: UILabel!
    var tempIndex: Int = 0
    var currentMonthIndex: Int = 0
    var currentYear: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let now = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/YYYY"
        let curerntMY = dateFormatter.string(from: now as Date)
        initTabList(curerntMY: curerntMY)
        print(curerntMY)
    }
    
    func initTabList(curerntMY: String) {
        let data = curerntMY.components(separatedBy: "/")
        let currentMonth = data[0]
        currentYear = data[1]
        for i in 0 ..< month.count {
            if currentMonth == month[i] {
                currentMonthIndex = i
                tempIndex = i
                lbCurrentMonth.text = "THIS MONTH"
                lbNextMonth.text = month[i+1] + "/" + currentYear
                lbPreveousMonth.text =  month[i-1] + "/" + currentYear
            }
        }
    }
    @IBAction func previousMonth(_ sender: UITapGestureRecognizer) {
        guard tempIndex > 1 else {
            
            return
        }
        
        tempIndex -= 1
        let temp = tempIndex + 1
        let temp2 = tempIndex - 1
        if tempIndex == 1 {
            lbPreveousMonth.text = ""
            lbCurrentMonth.text = month[tempIndex] + "/" + currentYear
            lbNextMonth.text =  month[tempIndex+1] + "/" + currentYear
        } else {
            if tempIndex == currentMonthIndex {
                lbPreveousMonth.text = month[tempIndex-1] + "/" + currentYear
                lbCurrentMonth.text = "THIS MONTH"
                lbNextMonth.text =  month[tempIndex+1] + "/" + currentYear
            } else {
                if temp == currentMonthIndex {
                    lbNextMonth.text = "THIS MONTH"
                    lbCurrentMonth.text = month[tempIndex] + "/" + currentYear
                    lbPreveousMonth.text =  month[tempIndex-1] + "/" + currentYear
                } else {
                    if temp2 == currentMonthIndex {
                        lbPreveousMonth.text =  "THIS MONTH"
                    } else {
                        lbPreveousMonth.text =  month[tempIndex-1] + "/" + currentYear
                    }
                    lbNextMonth.text = month[tempIndex+1] + "/" + currentYear
                    lbCurrentMonth.text = month[tempIndex] + "/" + currentYear
                }
            }
        }
        
        
    }
    @IBAction func nextMonth(_ sender: UITapGestureRecognizer) {
        guard tempIndex < 12 else {
            return
        }
        tempIndex += 1
        print("Next: \(tempIndex)")
        let temp = tempIndex - 1
        let temp2 = tempIndex + 1
        if tempIndex == 12 {
            lbPreveousMonth.text = month[tempIndex-1] + "/" + currentYear
            lbCurrentMonth.text = month[tempIndex] + "/" + currentYear
            lbNextMonth.text =  ""
        } else {
            if tempIndex == currentMonthIndex {
                lbPreveousMonth.text = month[tempIndex-1] + "/" + currentYear
                lbCurrentMonth.text = "THIS MONTH"
                lbNextMonth.text =  month[tempIndex+1] + "/" + currentYear
            } else {
                if temp == currentMonthIndex {
                    lbPreveousMonth.text = "THIS MONTH"
                    lbCurrentMonth.text = month[tempIndex] + "/" + currentYear
                    lbNextMonth.text =  month[tempIndex+1] + "/" + currentYear
                } else {
                    if temp2 == currentMonthIndex {
                        lbNextMonth.text =  "THIS MONTH"
                    } else {
                        lbNextMonth.text =  month[tempIndex+1] + "/" + currentYear
                    }
                    lbPreveousMonth.text = month[tempIndex-1] + "/" + currentYear
                    lbCurrentMonth.text = month[tempIndex] + "/" + currentYear
                }
            }
        }
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

