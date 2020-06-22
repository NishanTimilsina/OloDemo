//
//  HomeViewConfigurable.swift
//  OloProjectDemo
//
//  Created by Timilsina, Nishan on 6/22/20.
//  Copyright © 2020 Timilsina, Nishan. All rights reserved.
//

import Foundation

protocol HomeViewDelegate {
    func refreshTableView()
}

protocol HomeViewConfigurable {
        
    func numberOfRowsIn(section: Int) -> Int?
    func numberOfSections() -> Int
    func getDataFromFile(CompletionHandler: @escaping ([PizzaModel])->Void)
}
