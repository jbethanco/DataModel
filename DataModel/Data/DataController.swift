//
//  DataController.swift
//

import CoreData

class DataController: ObservableObject {

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {

        container = NSPersistentContainer(name: "DataModel")

        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { _, error in

            if let error = error {
                fatalError("Fatal error loading store: \(error.localizedDescription)")
               // AlertProvider.shared.showAlertWithTitle(title: "Load Persistent Store Error", message: "\(error), \(error.userInfo). Please screenshot and send to the dev team.")

            }
        }
    }

    func save() {
        guard container.viewContext.hasChanges else { return }

        do {
            try container.viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // let nsError = error as NSError
            // Temporary. Want to have a Jira component send or at least an email message or mattermost hook to send errors directly if possible.
            // AlertProvider.shared.showAlertWithTitle(title: "Context Save Error", message: "\(nsError), \(nsError.userInfo). Please screenshot and send to the dev team.")
        }
    }

    func delete(_ object: NSManagedObject) {
        container.viewContext.delete(object)
    }

    func deleteAllEvents() {

        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Event.fetchRequest()
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            _ = try container.viewContext.execute(batchDeleteRequest)
        } catch {
            fatalError("Failed to delete stuff")
        }

    }

}
