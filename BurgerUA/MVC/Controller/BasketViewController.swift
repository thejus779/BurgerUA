//
//  BasketViewController.swift
//  BurgerUA
//
//  Created by thejus manoharan on 16/06/2018.
//  Copyright © 2018 thejus. All rights reserved.
//

import UIKit

class BasketViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    
    @IBOutlet weak var labelNotFounf: UILabel!
    @IBOutlet weak var tableBasket: UITableView!
    @IBOutlet weak var labelTotal: UILabel!
    var basketBurgers = [Burgers]()
    var sum:Int = 0
    var conv = Conversions()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        for burger in basketBurgers{
            sum = sum + burger.price!
        }
        
        labelTotal.text = Constants.totalMessage + conv.formattedPrice(price: sum)
        
        self.tableBasket.reloadData()
        
        if basketBurgers.count>0 {
            labelNotFounf.isHidden = true
        }
        else{
            labelNotFounf.isHidden = false
        }
    }

    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return basketBurgers.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BasketTableViewCell = self.tableBasket.dequeueReusableCell(withIdentifier: Constants.basketCell) as! BasketTableViewCell
        let burger = basketBurgers[indexPath.row]
        
        cell.labelName?.text = burger.title
        cell.labelNumber.text = String(indexPath.row+1)
        
        if let price = burger.price{
            cell.labelPrice?.text = conv.formattedPrice(price: price)
            
        }

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    
    // MARK: - Actions
    @IBAction func actionBack(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }

}
