//
//  CalenderViewController.swift
//  Fleet Tracker
//
//  Created by Rohan Desai on 10/05/20.
//  Copyright © 2020 Mobiliya. All rights reserved.
//

import UIKit
import FSCalendar

protocol CalenderViewControllerDelegate {
    func getSelectedDateFromCalendar(date:String)
}





class CalenderViewController: BaseViewController {
    
    @IBOutlet weak var calendarView: FSCalendar!
    
  //  public static let shared = CalenderViewController()
    
    var calenderViewControllerDelegate:CalenderViewControllerDelegate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.delegate = self
        self.definesPresentationContext = true
        self.providesPresentationContextTransitionStyle = true
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
        self.view.backgroundColor = UIColor.init(white: 0.4, alpha: 0.8)
    }
    
    
    
}


extension CalenderViewController:FSCalendarDelegate
{
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("")
        let formatter = DateFormatter()
        // formatter.dateFormat = "MM-dd-YYYY"
        formatter.dateFormat = "yyyy-MM-dd"
        let string = formatter.string(from: date)
        print("\(string)")
        self.calenderViewControllerDelegate?.getSelectedDateFromCalendar(date: string)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    
    
    
    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        
        if date .compare(Date()) == .orderedDescending {
            return false
        }
        else
        {
            return true
        }
    }
}
