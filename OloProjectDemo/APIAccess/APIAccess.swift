//
//  APIAccess.swift
//  OloProjectDemo
//
//  Created by Timilsina, Nishan on 6/22/20.
//  Copyright © 2020 Timilsina, Nishan. All rights reserved.
//

import Foundation

let baseURL = "https://itunes.apple.com/"

class APIAccess{

static let shared = APIAccess()

private init(){}

func getDataFromURL(endPoint endPoints:String, CompletionHandler: @escaping ([Pizza])->Void){
    
    
    guard let url = URL(string: baseURL+endPoints)else {return}
    let request  = URLRequest(url: url)
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let data  = data{
            if  let decodeResponse = try? JSONDecoder().decode(Pizza.self, from: data){
                //CompletionHandler(decodeResponse.toppings)
            }
            return
        }
    }.resume()
}
    
    
    func getDataFromFile(fileName file:String, CompletionHandler: @escaping ([Topping])->Void){
        
       if let path = Bundle.main.path(forResource: file, ofType: "json") {
           do {
               let fileUrl = URL(fileURLWithPath: path)
               // Getting data from JSON file using the file URL
               let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                   if  let decodeResponse = try? JSONDecoder().decode(Pizza.self, from: data){
                    CompletionHandler(decodeResponse)
                   }
                   return
           } catch {
               // Handle error here
           }
       }
    }
}
