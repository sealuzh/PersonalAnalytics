//
//  TaskProductivityTracker.swift
//  PersonalAnalytics
//
//  Created by Chris Satterfield on 2017-06-26.
//

import Foundation

class TaskProductivityTracker: NSObject, Tracker{
    
    var viz: [Visualization] = []
    let type: String = "TaskProductivity"
    var notificationTimer: Timer?
    var isIdle = false
    var isPaused = false
    let summaryIntervalMinutes: Double = 90
    //var notificationsDisabled: Boolean = false


    override init(){
        super.init()
        //notificationTimer = Timer.scheduledTimer(timeInterval: summaryIntervalMinutes * 60.0, target: self, selector: #selector(showNotificationThatLinksToSummary), userInfo: nil, repeats: true)
        //notificationTimer?.tolerance = 120
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleIdle(_:)), name: NSNotification.Name(rawValue: "isIdle"), object: nil)
        
        do{
            viz.append(try DayProductivityTimeline())
        }
        catch{
            print(error)
        }
        do{
            viz.append(try DayWeekProductivityTimeline())
        }
        catch{
            print(error)
        }
    }

    
    @objc
    func handleIdle(_ notification: NSNotification){
        if(notification.userInfo?["isidle"] as! Bool == true){
            isIdle = true
            //notificationTimer?.invalidate()
        }
        else{
            if(isIdle == true){
                //self.notificationTimer = Timer.scheduledTimer(timeInterval: summaryIntervalMinutes * 60.0, target: self, selector: #selector(TaskProductivityTracker.showNotificationThatLinksToSummary), userInfo: nil, repeats: true)
                isIdle = false
            }
        }
    }
 /*
    func disableNotifications(){
        notificationsDisabled = true
    }
    
    func enableNotifications(){
        notificationsDisabled = false
    }
    */
    func pause(){
        //TODO: do something
    }
    
    func resume(){
        //TODO: do something
    }
    
    @objc func showNotificationThatLinksToSummary(){
        /*if(notificationsDisabled){
            return
        }*/
        let note = NSUserNotification()
        note.title = "Task Summarizing"
        note.informativeText = "\(summaryIntervalMinutes) minutes is up, please take 15 seconds to fill out the survey."
        //note.contentImage = NSImage(byReferencingURL: NSURL(string: "http://assets.brand.ubc.ca/signatures/2015/ubc_brand_assets_blue/4_logo/rgb/s4b282c2015.png")!)
        note.hasReplyButton = false
        note.responsePlaceholder = "Thanks! Please enter what you're working on"
        note.actionButtonTitle = "Answer Questions"
        note.hasActionButton = true
        NSUserNotificationCenter.default.deliver(note)
    }
    
    deinit{
        NotificationCenter.default.removeObserver(self, name: Notification.Name("isIdle"), object: nil)
    }
}