//
//  RestaurentsListViewController.swift
//  HotelListing
//
//  Created by Aadesh Maheshwari on 09/12/15.
//  Copyright © 2015 Aadesh Maheshwari. All rights reserved.
//

import UIKit
import SDWebImage
import Alamofire
import SwiftyJSON

class RestaurentsListViewController: UITableViewController {

    private let cellIdentifier = "RestaurentCellIdentifier"
    var restaurentList = [Restaurent]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        fetchHotelsData()
    }
    
    func fetchHotelsData() {
        Alamofire.request(Router.UtilRouteManager(UtilRouter.GetHotelsData())).responseJSON { ( response) in
            if response.result.isSuccess {
                let jsonObj = JSON(response.result.value!)
                
                if let resultDict = jsonObj["results"].dictionary {
                    print("result Dict \(resultDict)")
                    if let resultArray = resultDict["restaurants"]!.array {
                        for subjson:JSON in resultArray {
                            let restaurent = Restaurent(json: subjson)
                            self.restaurentList.append(restaurent)
                        }
                    }
                    if self.restaurentList.count > 0 {
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            self.tableView.reloadData()
                        })
                    }
                } else {
                    print("result Dict is empty")
                }
            }
            else {
                print("Error \(response.response?.statusCode) message \(response.response?.debugDescription) ")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurentList.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RestaurentViewCell
        cell.selectionStyle = .None
        
        if let restaurent: Restaurent = restaurentList[indexPath.row] {
            if let name = restaurent.name {
                cell.restaurentName.text = name
            }
            if let price = restaurent.price {
                cell.priceLabel.text = price
            }
            if let url = restaurent.imageURl {
                cell.showCaseImageView.sd_setImageWithURL(NSURL(string: url))
            }
        }
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
