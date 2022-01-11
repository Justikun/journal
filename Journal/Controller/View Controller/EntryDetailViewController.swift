//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by Justin Lowry on 12/14/21.
//

import UIKit

class EntryDetailViewController: UIViewController {

    
    // MARK: - Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    //MARK: - Properties
    var entry: Entry?
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    //MARK: - Actions
    @IBAction func clearButtonTapped(_ sender: Any) {
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let entry = entry {
            print("To be implemented tomorrow")
        } else {
            guard let titleText = titleTextField.text,
                  let bodyText = bodyTextView.text,
                  !titleText.isEmpty else {
                      let alert = UIAlertController(title: "Cannot save", message: "You cannot save without adding a title", preferredStyle: .alert)
                      alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
                      alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

                      self.present(alert, animated: true)
                      self.navigationController?.popViewController(animated: true)
                      return
                  }
            let entry = Entry(title: titleText, body: bodyText)
            EntryController.shared.add(entry: entry)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Helper functions
    func updateViews() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextView.text = entry.body
    }
}
