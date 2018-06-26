//
//  ListTableViewCell.swift
//  BurgerUA
//
//  Created by thejus manoharan on 16/06/2018.
//  Copyright © 2018 thejus. All rights reserved.
//

import UIKit

protocol ListCellDelegate: class {
    func actionButtonClicked(cell: ListTableViewCell)
}


class ListTableViewCell: UITableViewCell {

    weak var delegate: ListCellDelegate?
    
    @IBOutlet weak var imageBurger: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    @IBAction func actionAddToBasket(_ sender: Any) {
        delegate?.actionButtonClicked(cell:self)
    }
}
