//
//  JsonViewController.swift
//  PlayerApp
//
//  Created by Apple on 31/07/15.
//  Copyright (c) 2015 idroid. All rights reserved.
//

import UIKit

class JsonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        /***** NOTE :first webservice implementation ******/
        
//        var endpoint = NSURL(string: "http:www.agorapp.it/adm/webservices/get_free_recipe.php")
//        var responseData = NSData(contentsOfURL: endpoint!)
//        var jsonError: NSError?
//        
//        var dicJson:NSDictionary! = NSJSONSerialization.JSONObjectWithData(responseData!, options: nil, error: &jsonError) as! NSDictionary;
//        
//        var dicResponse:NSDictionary! = dicJson.objectForKey("responseData") as! NSDictionary
//        
//        var dicKey: AnyObject? = nil
//        for dicKey in dicResponse.allKeys {
//            
//            var dicResult: NSDictionary! = dicResponse.objectForKey(dicKey) as! NSDictionary
//            var dicResultKey: AnyObject? = nil
//            
//            
//            for dicResultKey in dicResult.allKeys {
//                
//                var ky: NSString = dicResultKey as! NSString
//                var vl: AnyObject = dicResult.objectForKey(ky)!
//                print("\n\(ky) : \(vl)")
//                
//            }
//            
//        }


        
        /***** NOTE :second webservice implementation ******/
        
//        var dataUrl = NSURL(string: "http://www.agorapp.it/adm/webservices/get_all_category.php")
//        var responseData = NSData(contentsOfURL: dataUrl!)
//        var jsonError: NSError?
//        var jsonDic:NSDictionary! = NSJSONSerialization.JSONObjectWithData(responseData!, options: nil, error: &jsonError) as! NSDictionary
//        //println(jsonDic)
//        var mainDic:NSDictionary = jsonDic.objectForKey("responseData") as! NSDictionary
//        //println(mainDic.allKeys)
//       // println("\n-----------------------------------")
//
//        for key in mainDic.allKeys{
//            //println(mainDic.objectForKey(key))
//            
//            var subDic:NSDictionary = mainDic.objectForKey(key) as! NSDictionary
//            
//            /*println(subDic)
//            for k in subDic.allKeys{
//                print("key => \(k)         : value=>  \(subDic.objectForKey(k)!)")
//                
//            }*/
//            
//            for k in subDic{
//                
//                println(k.value)
//            }
//
//            println("\n-----------------------------------")
//        }
        
        
         /***** NOTE :third webservice implementation ******/
        
        var url = NSURL(string: "http://www.agorapp.it/adm/webservices/get_recipe_detail.php?recipe_id=6")
        var data = NSData(contentsOfURL: url!)
        var jsonError: NSError?
        
        var response:NSDictionary = NSJSONSerialization.JSONObjectWithData(data!, options: nil, error: &jsonError) as! NSDictionary
        //println(response)
     
        var responseData:NSDictionary = response.objectForKey("responseData") as! NSDictionary
       // println(responseData)
        //println(responseData.allKeys)
        
        for mainKey in  responseData.allKeys{
            //println(mainKey)
            
            var subDic:NSDictionary = responseData.objectForKey(mainKey) as! NSDictionary
            for subKey in subDic.allKeys
            {
                var recipe_phase_key: String = subKey as! String
                if recipe_phase_key != "recipe_phase" {
                   println("\(subKey)      :   \(subDic.objectForKey(subKey)!)")
                }
               else if recipe_phase_key == "recipe_phase" {
                    println("-------------------------------")
                    var recipe_phase:NSDictionary = subDic.objectForKey("recipe_phase") as! NSDictionary
                    //println(dic.allKeys)
                    
                    for recipe_phase_keys in recipe_phase.allKeys{
                        var sub_recipe_phase: NSDictionary = recipe_phase.objectForKey(recipe_phase_keys) as! NSDictionary
                        
                        for sub_recipe_phase_keys in sub_recipe_phase.allKeys{
                           // println(sub_recipe_phase_keys)
                            
                            var str:String = sub_recipe_phase_keys as! String
                            if str != "recipe_ing"{
                                //println(sub_recipe_phase.objectForKey(sub_recipe_phase_keys)!)
                                println("key:   \(sub_recipe_phase_keys)    value: \(sub_recipe_phase.objectForKey(sub_recipe_phase_keys)!)")
                            }
                            else
                            {
                                var recipe_ing:NSDictionary = sub_recipe_phase.objectForKey("recipe_ing") as! NSDictionary
                                //println(recipe_ing)
                                for recipe_ing_keys in recipe_ing.allKeys{
                                    
                                  // println(recipe_ing_keys.value)
                                    
                                    var subrecipe_ing: NSDictionary = recipe_ing.objectForKey(recipe_ing_keys) as! NSDictionary
                                    for subr in subrecipe_ing{
                                        //println(subr.value)
                                        println("key:  \(subr.key)   value:   \(subr.value)")
                                    }
                                    
                                }
                            }
                            
                        }
                       
                    }
                }
                
                
            }
            
        }
        
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //send data to server by webservice
    @IBAction func submitAction(sender: AnyObject) {
        
        //declare parameter as a dictionary which contains string as key and value combination.
        var parameters = ["name": "bhavesh", "password": "padmani"] as Dictionary<String, String>
        
        //create the url with NSURL
        let url = NSURL(string: "http://myServerName.com/api") //change the url
        
        //create the session object
        var session = NSURLSession.sharedSession()
        
        //now create the NSMutableRequest object using the url object
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "POST" //set http method as POST
        
        var err: NSError?
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(parameters, options: nil, error: &err) // pass dictionary to nsdata object and set it as request body
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
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
