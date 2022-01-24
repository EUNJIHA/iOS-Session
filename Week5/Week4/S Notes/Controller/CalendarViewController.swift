//
//  CalendarViewController.swift
//  Week4
//
//  Created by mac on 2021/02/18.
//

import UIKit
import CVCalendar

class CalendarViewController: UIViewController{
    
    @IBOutlet weak var menuView: CVCalendarMenuView!
    @IBOutlet weak var calendarView: CVCalendarView!
    @IBOutlet weak var monthLabel: UILabel!
    
    @IBOutlet weak var modeSegmentedControl: UISegmentedControl!
    
    private var currentCalendar: Calendar?
    
    @IBAction func modeChangedAction(_ sender: Any) {
        
        switch modeSegmentedControl.selectedSegmentIndex
        {
        case 0:
            calendarView.changeMode(.monthView)
        case 1:
            calendarView.changeMode(.weekView)
        default:
            break
        }
    }
    
    override func awakeFromNib() {
        let timeZoneBias = 540 // (UTC+09:00)
        currentCalendar = Calendar(identifier: .gregorian)
        currentCalendar?.locale = Locale(identifier: "fr_FR")
        if let timeZone = TimeZone(secondsFromGMT: -timeZoneBias * 60) {
            currentCalendar?.timeZone = timeZone
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let currentCalendar = currentCalendar {
            monthLabel.text = CVDate(date: Date(), calendar: currentCalendar).globalDescription
        }
        
        menuView.menuViewDelegate = self
        calendarView.calendarDelegate = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        menuView.commitMenuViewUpdate()
        calendarView.commitCalendarViewUpdate()
    }
}

extension CalendarViewController: CVCalendarViewDelegate, CVCalendarMenuViewDelegate{
    func presentationMode() -> CalendarMode {
        return .monthView
    }
    
    func firstWeekday() -> Weekday {
        return .sunday
    }
    
    func presentedDateUpdated(_ date: CVDate) {
        if monthLabel.text != date.globalDescription{
            
            monthLabel.text = date.globalDescription

        }
    }
}

