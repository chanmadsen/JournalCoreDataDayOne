//
//  EntryListTableViewController.swift
//  JournalCoreData
//
//  Created by Lon Chandler Madsen on 7/26/21.
//

import UIKit

class EntryListTableViewController: UITableViewController {
    
    //MARK: - Outlets
    
    
   //MARK: - LifeCycles
override func viewDidLoad() {
        super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    EntryController.shared.fetchEntries()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
    }

    //MARK: - Helper Methods
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EntryController.shared.entries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryTitleCell", for: indexPath)
        let entry = EntryController.shared.entries[indexPath.row]
        cell.textLabel?.text = entry.title
        return cell
    }
    
    
//MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEditDetailVC" {
        guard let indexPath = tableView.indexPathForSelectedRow,
              let destination = segue.destination as? EntryDetailViewController
        else { return }
            let entry = EntryController.shared.entries[indexPath.row]
            destination.entry = entry
        }
    }
}//End of Class

