//
//  EntryTableViewController.swift
//  Journal
//
//  Created by Justin Lowry on 12/13/21.
//

import UIKit

class EntryTableViewController: UITableViewController {

    // MARK: - Outlets
    @IBOutlet var journalTableView: UITableView!
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        journalTableView.reloadData()
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.shared.entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)

        let entry = EntryController.shared.entries[indexPath.row]
        cell.textLabel?.text = entry.title
        

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let entryToDelete = EntryController.shared.entries[indexPath.row]
            EntryController.shared.deleteEntry(entry: entryToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // IIDOO
        // Identifier, Index, Destination,
        if segue.identifier == "toEntryDetailVC" {
            guard let indexPath = journalTableView.indexPathForSelectedRow,
                  let destination = segue.destination as? EntryDetailViewController else { return }
            let entry = EntryController.shared.entries[indexPath.row]
            destination.entry = entry
        }
    }
}
