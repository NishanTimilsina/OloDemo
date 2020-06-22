//
//  HomeViewController.swift
//  OloProjectDemo
//
//  Created by Timilsina, Nishan on 6/22/20.
//  Copyright © 2020 Timilsina, Nishan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var vm = HomeViewModel()
    var sortedList:[PizzaModel]?
    @IBOutlet weak var homeTablevVew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Frequent Pizza orders"
        sortedList = [PizzaModel]()
        
        vm.getDataFromFile { (results) in
            DispatchQueue.main.async {
                self.sortedList = results
                self.homeTablevVew.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sortedList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PizzaCell", for: indexPath) as! CustomPizzaTableViewCell
        
        // Configure the cell...
        cell.displayImage.makeRounded()
        let result =  sortedList?[indexPath.row]
        cell.displayUI(model: result!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension HomeViewController:HomeViewDelegate{
    
    func refreshTableView() {
        self.homeTablevVew.reloadData()
    }
    
}
extension UIImageView {
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }
        
        // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
    func makeRounded() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.purple.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}

