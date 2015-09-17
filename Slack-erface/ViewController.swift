//
//  ViewController.swift
//  Slack-erface
//
//  Created by Gregory Rudolph-Alverson on 9/16/15.
//  Copyright (c) 2015 STEiN-Net. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
// curl --data "Hello from Slackbot" $'https://sunypoly.slack.com/services/hooks/slackbot?token=Gpxor1OKcPZM0nxgohyu1WGZ&channel=%23general' | Example
    
    var slackURL = "https://sunypoly.slack.com/services/hooks/slackbot?token=Gpxor1OKcPZM0nxgohyu1WGZ&channel=%23"
    var channel = "#general"
    var message = ""
    var connect = Connector()
    var announce = Announcer()
    var userDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var channelText: NSTextField!
    @IBOutlet weak var speechText: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func sayIt(sender: AnyObject) {
        message = speechText.stringValue
        if channelText.stringValue == "" {}
        else { channel = channelText.stringValue }
        connect.post(message, p_chan: channel)
    }
    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

