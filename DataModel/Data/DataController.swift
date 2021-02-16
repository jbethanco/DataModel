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
        
        container.loadPersistentStores { storeDescription, error in
             
            if let error = error {
                fatalError("Fatal error loading store: \(error.localizedDescription)")
            }
        }
    }
  
    func save() {
        if container.viewContext.hasChanges {
            try? container.viewContext.save()
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
