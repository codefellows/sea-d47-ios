//
//  SearchViewController.swift
//  KeychainDemo
//
//  Created by Adam Wallraff on 11/9/15.
//  Copyright © 2015 Adam Wallraff. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
  
  let allItems = ["Mike","Bob","Ryan","Adam"]
  var searchItems = [String]()
  
  var isSearching = false

  @IBOutlet var tableView: UITableView!
  
  @IBOutlet var searchBar: UISearchBar!
  
  
  class func prototypeCellIndentifier() -> String{
    return "Search_Cell"
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      self.tableView.dataSource = self
      self.searchBar.delegate = self

    }
  

  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(SearchViewController.prototypeCellIndentifier(), forIndexPath: indexPath)

    if isSearching{
      cell.textLabel?.text = searchItems[indexPath.row]
    }
    else{
      cell.textLabel?.text = allItems[indexPath.row]
    }

    
    return cell
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    if isSearching{
      return searchItems.count
    }
    
    return allItems.count
  }
  
  func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    
    searchItems = []
    
    if let text = searchBar.text{
        isSearching = true
        for item in allItems{
          if item.containsString(text){
            searchItems.append(item)
          }
      }
    }

    tableView.reloadData()
  }
  

  func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
    if searchText == ""{
      isSearching = false
      tableView.reloadData()
    }
  }
  
  
  searc
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
