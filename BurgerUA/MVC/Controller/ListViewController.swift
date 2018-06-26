//
//  ListViewController.swift
//  BurgerUA
//
//  Created by thejus manoharan on 16/06/2018.
//  Copyright © 2018 thejus. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import SDWebImage
import SCLAlertView

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,ListCellDelegate {
    
    @IBOutlet weak var buttonBasket: UIButton!
    @IBOutlet weak var tableLists: UITableView!
    var arrRes = [[String:AnyObject]]()
    var burgers = [Burgers]()
    var basketBurgers = [Burgers]()
    var conv = Conversions()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableHeightAutomatic()
        fetchData()
    }
    
    // Table automatic height
    func tableHeightAutomatic(){
        tableLists.estimatedRowHeight = 136
        tableLists.rowHeight = UITableViewAutomaticDimension
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrRes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ListTableViewCell = self.tableLists.dequeueReusableCell(withIdentifier: Constants.listCell) as! ListTableViewCell
        let burger = burgers[indexPath.row]
        cell.delegate = self
        
        cell.labelName?.text = burger.title
        cell.labelDescription?.text = burger.desc
        cell.imageBurger.sd_setImage(with: URL(string: burger.thumbnail!), placeholderImage: UIImage(named: Constants.burgePlaceHolder))
        if let cost = burger.price{
            cell.labelPrice?.text = conv.formattedPrice(price: cost)
        }
        
        return cell
    }
    
    
    // MARK: - Action basket clicked
    
    @IBAction func actionBasketClicked(_ sender: Any) {
        performSegue(withIdentifier: Constants.segueList, sender: self)
    }
    
    @IBAction func actionReloadData(_ sender: Any) {
        self.fetchData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == Constants.segueList) {
            let destVC = segue.destination as! BasketViewController
            if self.basketBurgers.count>0{
               destVC.basketBurgers = self.basketBurgers
            }
            
        }
    }
    
    // MARK: - Fetch data call
    func fetchData(){
        let manager = APIManager()
        manager.request(with: BurgerEndPoint.getAllData() , completion: { (Response) in
            print(Response)
            switch Response {
                
            case .success(let json):
                
                for burger in json.arrayObject! {
                    let burger = Burgers(JSON: burger as! [String: Any])
                    self.burgers.append(burger!)
                }
                print(self.burgers)
                self.arrRes = json.arrayObject as! [[String : AnyObject]]
                self.tableLists.reloadData()
                break
                
            case .failure( _):
                break
                
            }
        }, isLoaderNeeded: true)
        
        
    }
    
    // MARK: - ListCell Delegates
    func actionButtonClicked(cell: ListTableViewCell) {
        guard let indexPath = self.tableLists.indexPath(for: cell) else {
            return
        }
        self.basketBurgers.append(burgers[indexPath.row])
        SCLAlertView().showSuccess(Constants.successMessage, subTitle: Constants.adddedToCart)
        print(basketBurgers)
    }
}
