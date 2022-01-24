//
//  SearchViewController.swift
//  Week4
//
//  Created by mac on 2021/02/05.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var notes = Note.noteList1 + Note.noteList1 + Note.noteList1 + Note.noteList1 + Note.noteList1

    
    var filteredCandies = [Note]()
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // 어떤 Cell이 들어갈까?
        let searchCell: UINib = UINib(nibName: "SearchTableViewCell", bundle: Bundle.main)
        tableView.register(searchCell, forCellReuseIdentifier: "SearchTableViewCell")
        
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Notes"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    
    // MARK: - Private instance methods
    
//    func filterContentForSearchText(_ searchText: String, scope: String = "Grace") {
//        filteredCandies = Note.noteList1.filter({(noteItem : Note) -> Bool in
//        let doesCategoryMatch = (scope == "Grace") || (noteItem.category == scope)
//
//        if searchBarIsEmpty() {
//          return doesCategoryMatch
//        } else {
//            return doesCategoryMatch && ((noteItem.title?.lowercased().contains(searchText.lowercased())) != nil)
//        }
//      })
//      tableView.reloadData()
//    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
      filteredCandies = notes.filter({( candy : Note) -> Bool in
        return (candy.title?.lowercased().contains(searchText.lowercased()))!
      })

      tableView.reloadData()
    }
    
    func searchBarIsEmpty() -> Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func isFiltering() -> Bool {
      return searchController.isActive && !searchBarIsEmpty()
    }
}


extension SearchViewController: UISearchResultsUpdating {
  // MARK: - UISearchResultsUpdating Delegate
  func updateSearchResults(for searchController: UISearchController) {
//    let searchBar = searchController.searchBar
//    let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
    filterContentForSearchText(searchController.searchBar.text!)
//    filterContentForSearchText(searchController.searchBar.text!, scope: scope)

  }
}

//extension SearchViewController: UISearchBarDelegate {
//  // MARK: - UISearchBar Delegate
//  func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//    filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
//  }
//}


extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        if isFiltering() {
////          searchFooter.setIsFilteringToShow(filteredItemCount: filteredCandies.count, of: candies.count)
//          return filteredCandies.count
//        }
//
////        searchFooter.setNotFiltering()
//
//
//        return notes.count
//    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      if isFiltering() {
        return filteredCandies.count
      }
        
      return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell else {
            return UITableViewCell()
        }
        
        // 여기가 문제 인듯
        let candy: Note
        if isFiltering() {
            candy = filteredCandies[indexPath.row]
        } else {
            candy = notes[indexPath.row]
        }
        cell.updateUI(noteItem: candy)
        //      cell.textLabel!.text = candy.title // 여기를 바꿔야 겠지?
        //      cell.detailTextLabel!.text = candy.category
        return cell
    }
    
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//
//        guard let searchCell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell else {
//            return UITableViewCell()
//        }
//
////        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath)
//        let candy: Note
//        if isFiltering() {
//          candy = filteredCandies[indexPath.row]
//        } else {
//          candy = notes[indexPath.row]
//        }
//
//        searchCell.updateUI(noteItem: candy)
//        return searchCell
//
//
//    }
    
    
}
