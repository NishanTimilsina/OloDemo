//
//  Pizza.swift
//  OloProjectDemo
//
//  Created by Timilsina, Nishan on 6/22/20.
//  Copyright © 2020 Timilsina, Nishan. All rights reserved.
//

import Foundation

struct Topping: Codable {
    let toppings: [String]
}

typealias Pizza = [Topping]


enum PizzaToping{
    
    case pineapple
    case    black_olives
    case   mushrooms
    case   bacon
    case  jalapenos
}

struct PizzaModel{
    var toppings:String
    var count:Int
}
