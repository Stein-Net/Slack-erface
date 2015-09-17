//
//  Connector.swift
//  Slack-erface
//
//  Created by Gregory Rudolph-Alverson on 9/17/15.
//  Copyright (c) 2015 STEiN-Net. All rights reserved.
//

import Foundation

// curl -X POST --data-urlencode 'payload={"text": "Assholes.", "channel": "#satanists", "username": "announce-bot", "icon_emoji": ":tv:"}' https://hooks.slack.com/services/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  | Example using another bot
class Connector {
    
    init(){}
    var userDefaults = NSUserDefaults.standardUserDefaults()
    var text = "This is posted to <#general> and comes from *monkey-bot*."
    var channel = "#general"
    var username = "announce-bot"
    var icon_emoji = ":tv:"
    var request = NSMutableURLRequest(URL: NSURL(string: "https://hooks.slack.com/services/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")!)
    var session = NSURLSession.sharedSession()
    
    
    func post(p_text: String, p_chan: String) {
        text = p_text
        channel = p_chan
        request.HTTPMethod = "POST"
        println("Posting")
        var params = ["text":text, "channel":channel, "username":username, "icon_emoji":icon_emoji] as Dictionary<String, String>
        var err: NSError?
        println("setting body")
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
        println("adding value")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        println("making task")
        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            println("task made?")
            println("Response: \(response)")
            var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
            println("Body: \(strData)")
            var err: NSError?
            var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &err) as? NSDictionary
            
            // Did the JSONObjectWithData constructor return an error? If so, log the error to the console
            if(err != nil) {
                println(err!.localizedDescription)
                let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                println("Error could not parse JSON: '\(jsonStr)'")
            }
            else {
                // The JSONObjectWithData constructor didn't return an error. But, we should still
                // check and make sure that json has a value using optional binding.
                if let parseJSON = json {
                    // Okay, the parsedJSON is here, let's get the value for 'success' out of it
                    var success = parseJSON["success"] as? Int
                    println("Succes: \(success)")
                }
                else {
                    // Woa, okay the json object was nil, something went worng. Maybe the server isn't running?
                    let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                    println("Error could not parse JSON: \(jsonStr)")
                }
            }
        })
        task.resume()
    }
    func announce(p_chan: String, p_mess: Dictionary<String, String>) {
        
        
        channel = p_chan
        request.HTTPMethod = "POST"
        println("Posting")
        var params = ["attachments":p_mess, "channel":channel, "username":username, "icon_emoji":icon_emoji] as Dictionary<String, AnyObject>
        var err: NSError?
        println("setting body")
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
        println("adding value")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        println("making task")
        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            println("task made?")
            println("Response: \(response)")
            var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
            println("Body: \(strData)")
            var err: NSError?
            var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &err) as? NSDictionary
            
            // Did the JSONObjectWithData constructor return an error? If so, log the error to the console
            if(err != nil) {
                println(err!.localizedDescription)
                let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                println("Error could not parse JSON: '\(jsonStr)'")
            }
            else {
                // The JSONObjectWithData constructor didn't return an error. But, we should still
                // check and make sure that json has a value using optional binding.
                if let parseJSON = json {
                    // Okay, the parsedJSON is here, let's get the value for 'success' out of it
                    var success = parseJSON["success"] as? Int
                    println("Succes: \(success)")
                }
                else {
                    // Woa, okay the json object was nil, something went worng. Maybe the server isn't running?
                    let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                    println("Error could not parse JSON: \(jsonStr)")
                }
            }
        })
        task.resume()
    }

}