//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by Lon Chandler Madsen on 7/26/21.
//

import UIKit

class EntryDetailViewController: UIViewController {

   
    //MARK: - Outlets
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    //MARK: - Properties
   
    var entry: Entry?
    
    //MARK: - LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    
    //MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty else { return }
        if let entry = entry {
            EntryController.shared.updateEntry(entry: entry, title: title, bodyText: bodyTextView.text)
        } else {
            EntryController.shared.createEntry(title: title, bodyText: bodyTextView.text, timeStamp: Date())
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearTextButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    //MARK: - Helper Methods
    
    func updateViews() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextView.text = entry.bodyText
        
    }
}//End of class
