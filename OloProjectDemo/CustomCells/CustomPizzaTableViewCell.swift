//
//  CustomPizzaTableViewCell.swift
//  OloProjectDemo
//
//  Created by Timilsina, Nishan on 6/22/20.
//  Copyright © 2020 Timilsina, Nishan. All rights reserved.
//

import UIKit

class CustomPizzaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var des: UILabel!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var totalOrdered: UILabel!
    @IBOutlet weak var displayImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func displayUI(model:PizzaModel){
        des.text = model.toppings
        totalOrdered.text = "Total Ordered: \(String(describing: model.count))"
    }
}
