//
//  APIConsumer.swift
//  Ayurveda
//
//  Created by mobile dev3 on 8/8/17.
//  Copyright © 2017 mobile dev3. All rights reserved.
//


import Foundation
import UIKit

protocol APIConsumerDelegate {
    func APIResponseArrived(_ Response:AnyObject)
}

class APIConsumer {
    var delegate:APIConsumerDelegate! = nil
    
    
    
    
    /*****
     func doRequestGet(_ url:String)  {
     
     let url = URL(string:url)
     let request = NSMutableURLRequest(url: url!)
     request.httpMethod = "GET"
     URLSession.shared.dataTask(with: url!, completionHandler: {
     (data: Data?,response : URLResponse?,error: NSError?) in
     do{
     let strData = NSString(data: data!, encoding: String.Encoding.utf8)
     print(strData)
     if error != nil{
     print("error")
     print(error?.localizedDescription)
     return
     }
     print("resoponse : \((response as?  HTTPURLResponse)?.statusCode)")
     if let res = response as?  HTTPURLResponse, res.statusCode == 200 {
     let jsonDic: NSDictionary = try (JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary)!
     
     DispatchQueue.main.async(execute: {
     if self.delegate != nil {
     self.delegate.APIResponseArrived(jsonDic)
     }
     })
     }else{
     print(response!.description)
     return
     }
     }
     catch{
     print("Exception thrown")
     }
     
     }).resume()
     }
     ***/
    
    func doRequestGet(_ url:String)  {
        
        let url = URL(string:url)
        let request = NSMutableURLRequest(url: url!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            do{
                
                if error != nil{
                    print("error")
                    print(error?.localizedDescription)
                    return
                }
                print("resoponse : \((response as?  HTTPURLResponse)?.statusCode)")
                if let res = response as?  HTTPURLResponse, res.statusCode == 200 {
                    let jsonDic: NSDictionary = try (JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary)!
                    
                    DispatchQueue.main.async(execute: {
                        if self.delegate != nil {
                            self.delegate.APIResponseArrived(jsonDic)
                        }
                    })
                }else{
                    print(response!.description)
                    return
                }
            }
            catch{
                print("Exception thrown")
            }
            
        }).resume()
    }
    
    //    func getUser(_ url:String, completionHandler: @escaping (NSDictionary?, NSError?) -> ()) {
    //
    //        let config = URLSessionConfiguration.default // Session Configuration
    //        let session = URLSession(configuration: config) // Load configuration into Session
    //        let url = URL(string: url)!
    //
    //        let task = session.dataTask(with: url, completionHandler: {
    //            (data, response, error) in
    //
    //            var dic: NSDictionary? = NSDictionary()
    //            if error != nil {
    //                completionHandler(nil, error as NSError?)
    //            } else {
    //                do {
    //                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] {
    //                        dic = json as NSDictionary?
    //                    }
    //                } catch(let error) {
    //                    print(error)
    //                    completionHandler(nil, error as NSError?)
    //                }
    //                completionHandler(dic,nil)
    //            }
    //        })
    //        task.resume()
    //    }
    //
    
    
    
    
    
    
    
}













//    func callWebservice(webUrl : String,headString : String ,callback : (arrItems : NSArray) -> () ){
//        let urlstring = NSURL(string: webUrl)
//        let plainString = headString//"mobile:ulan"
//        let plainData = (plainString as NSString).dataUsingEncoding(NSUTF8StringEncoding)
//        let base64String = "Basic " + plainData!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
//
//        let request = NSMutableURLRequest(URL: urlstring!)
//        request.HTTPMethod = "GET"
//        request.addValue(base64String, forHTTPHeaderField: "Authorization")
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: {
//            (data: NSData?,response : NSURLResponse?,error: NSError?) in
//            do{
//                let strData = NSString(data: data!, encoding: NSUTF8StringEncoding)
//                print(strData)
//                if error != nil{
//                    print("error")
//                    print(error?.localizedDescription)
//                    return
//                }
//                print("resoponse : \((response as?  NSHTTPURLResponse)?.statusCode)")
//                if let res = response as?  NSHTTPURLResponse where res.statusCode == 200 {
//                    let jsonDic: NSArray = try (NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as? NSArray)!
//                    //                    for i in jsonDic{
//                    //                        print(i.valueForKey("id"))
//                    //                        print(i["id"])
//                    print(jsonDic)
//                    callback(arrItems: jsonDic)
//                    //                 }
//                }else{
//                    print(response!.description)
//                    return
//                }
//
//
//            }
//            catch{
//                print("Exception thrown")
//            }
//        }).resume()
//
//    }
//


