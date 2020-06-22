//
//  HomeViewModel.swift
//  OloProjectDemo
//
//  Created by Timilsina, Nishan on 6/22/20.
//  Copyright © 2020 Timilsina, Nishan. All rights reserved.
//

import UIKit

class HomeViewModel:HomeViewConfigurable {
    
    var list:[Topping]?
    var sortedList:[PizzaModel]
    
    init(){
        list = [Topping]()
        sortedList = [PizzaModel]()
    }
    
    func getDataFromFile(CompletionHandler: @escaping ([PizzaModel]) -> Void) {
        
        APIAccess.shared.getDataFromFile(fileName:"pizzas") { (results) in
            DispatchQueue.main.async {
                self.list = results
                self.filteredList { (result) in
                    CompletionHandler(result)
                }
            }
        }
    }
    
    func filteredList(CompletionHandler: @escaping ([PizzaModel]) -> Void){
        
        var orderedList = [String]()
        if let tempList = list?.enumerated(){
            for (_,value) in  tempList{
                let sorted = value.toppings.sorted(by: { $0 < $1 }) //sort by alphabetical
                let key = sorted.map { $0.trimmingCharacters(in: .whitespaces) }.joined(separator: ",")
                orderedList.append(key)
            }
        }
        //created hashmap/dictionary to count frequency of toppings
        let mappedItems = orderedList.map { ($0, 1) }
        let counts = Dictionary(mappedItems, uniquingKeysWith: +)
        let finalList = counts.sorted { $0.value > $1.value }
        
        for (_,value) in finalList.enumerated(){
            let obj = PizzaModel(toppings: value.key, count: value.value)
            sortedList.append(obj)
        }
        CompletionHandler(sortedList)
    }
    var delegate:HomeViewDelegate?
    
    func numberOfRowsIn(section: Int) -> Int? {
        return sortedList.count
    }
    
    func numberOfSections() -> Int {
        return 1
    }
}
