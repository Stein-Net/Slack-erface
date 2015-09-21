//
//  Connector.swift
//  Slack-erface
//
//  Created by Gregory Rudolph-Alverson on 9/17/15.
//  Copyright (c) 2015 STEiN-Net. All rights reserved.
//

import Foundation
import Alamofire

// curl -X POST --data-urlencode 'payload={"text": "Assholes.", "channel": "#testing", "username": "announce-bot", "icon_emoji": ":tv:"}' https://hooks.slack.com/services/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  | Example using another bot
class Connector {
    
    init(){}
    var userDefaults = NSUserDefaults.standardUserDefaults()
    var text = "This is posted to <#general> and comes from *monkey-bot*."
    var channel = "#general"
    var username = "announce-bot"
    var icon_emoji = ":tv:"
    var url = "https://hooks.slack.com/services/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"
    var request = NSMutableURLRequest(URL: NSURL(string: "https://hooks.slack.com/services/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")!)
    var session = NSURLSession.sharedSession()
    
    func post(){
        let parameters = [
            "text": "bar",
            "channel": "#testing",
            "username": "announce-bot",
            "icon_emoji":":tv:" ]
        Alamofire.request(.POST, "https://hooks.slack.com/services/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", parameters: parameters)
            .response { request, response, data, error in
                print(request)
                print(response)
                print(error)
        }
        
    }
    func get() {
        
        
    }
    func announce(data: JSON, p_chan: String) {
        channel = p_chan
        request.HTTPMethod = "POST"
        print("posting")
        Alamofire.request(.GET, url)
            .response { request, response, data, error in
                print(request)
                print(response)
                print(error)
        }
        //print("Setting body")
        //request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: .PrettyPrint)
        //print("adding value")
        //request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.addValue("application/json", forHTTPHeaderField: "Accept")
    }
}