//
//  Announcer.swift
//  Slack-erface
//
//  Created by Gregory Rudolph-Alverson on 9/17/15.
//  Copyright (c) 2015 STEiN-Net. All rights reserved.
//

import Foundation
class Announcer: NSObject {
    override init(){}
    //var connect = Connector()
    
    //Functions will be below message array
    let messages = [
        "This chat is for SUNY Poly students, feel free to invite anyone with an @sunyit.edu email!",
        "If you would like to add an announcement, send a message to either @rudi or @lita-bot!",
        
    ]
    let colors = [
        "#B0171F", "#DA70D6", "#9400D3", "#0000FF", "#63B8FF", "#00F5FF", "#97FFFF", "#00FF7F", "#00C957", "#00FF00",
        "#FFFF00", "#FFA500", "#FF9912", "#FF6103", "#FA8072", "#7D9EC0"
    ]
    
    func announce() {
       // connect.post(getAnnouncement(), p_chan: "#testing")
    }
    
    func startTimer() {
        var announceTimer = NSTimer.scheduledTimerWithTimeInterval(900.0, target: self, selector: Selector("announce"), userInfo: nil, repeats: true)
       

    }
    
    func getAnnouncement() -> JSON {
        let randomIndex = Int(arc4random_uniform(UInt32(messages.count)))
        let m = messages[randomIndex]
        let randomHex = Int(arc4random_uniform(UInt32(colors.count)))
        let c = colors[randomHex]
        return makeAnnouncement(m, colorHex: c)
        
    }
    
    
    func makeAnnouncement(message: String, colorHex: String) -> JSON {
        let ret = "[{\"title\":\"Announcement\", \"text\":\"\(message)\", \"color\": \"\(colorHex)\"}]"
   
        let jsonObject = [
        "title": "Announcement",
        "text": message,
        "color": colorHex
        ] as JSON
        
        if let dataFromString = ret.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false) {
            let json = JSON(data: dataFromString)
        }
        return jsonObject;
        // API Example
        /* {
        "fallback": "Required plain-text summary of the attachment.",
        "color": "#36a64f",
        "pretext": "Optional text that appears above the attachment block",
        "author_name": "Bobby Tables",
        "author_link": "http://flickr.com/bobby/",
        "author_icon": "http://flickr.com/icons/bobby.jpg",
        "title": "Slack API Documentation",
        "title_link": "https://api.slack.com/",
        "text": "Optional text that appears within the attachment",
        "fields": [
        {
        "title": "Priority",
        "value": "High",
        "short": false
        }
        ],
        "image_url": "http://my-website.com/path/to/image.jpg",
        "thumb_url": "http://example.com/path/to/thumb.png"
        }
        ] */

    }
    
    
}
