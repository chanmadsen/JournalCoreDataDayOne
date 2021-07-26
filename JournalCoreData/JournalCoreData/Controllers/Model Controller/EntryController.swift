//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Lon Chandler Madsen on 7/26/21.
//

import CoreData

class EntryController {

    static let shared = EntryController()
    
    var entries: [Entry] = []
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    private init() {}
    
    //MARK: - CRUD Methods
    
    func createEntry(title: String, bodyText: String, timeStamp: Date) {
        let entry = Entry(title: title, bodyText: bodyText, timeStamp: timeStamp)
        entries.append(entry)
        
        CoreDataStack.saveContext()
    }

    func fetchEntries() {
        let entries = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
        self.entries = entries
    }
    
    func updateEntry(entry: Entry, title: String, bodyText: String) {
        entry.title = title
        entry.bodyText = bodyText
        
        CoreDataStack.saveContext()
        
    }
}//End of class
