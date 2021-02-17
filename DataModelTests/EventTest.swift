//
//  EventTest.swift
//  DataModelTests
//
//  Created by John Bethancourt on 2/15/21.
//

import XCTest
import CoreData
@testable import DataModel

class EventTest: XCTestCase {

    func testEventAndSortieCreateAndDelete() throws {

        let dataController = DataController(inMemory: true)
        let context =  dataController.container.viewContext

        // loads 6 events with 3 Sorties each
        SampleData.loadMockData1(viewContext: context)

        let eventRequest = NSFetchRequest<Event>(entityName: "Event")
        var events = try context.fetch(eventRequest)

        let sortieRequest = NSFetchRequest<Sortie>(entityName: "Sortie")
        var sorties = try context.fetch(sortieRequest)

        XCTAssertEqual(events.count, 6, "Wrong amount of Events were created.")
        XCTAssertEqual(sorties.count, events.count * 3, "Wrong amount of Sorties were created.")

        // Delete one event
        dataController.delete(events.first!)
        context.undo()

        // The delete should not occur as it was not saved and the context was undone
        XCTAssertEqual(events.count, 6, "Wrong amount of Events were created.")
        XCTAssertEqual(sorties.count, events.count * 3, "Wrong amount of Sorties were created.")

        dataController.delete(events.first!)
        dataController.save()
        context.undo()

        events = try context.fetch(eventRequest)
        sorties = try context.fetch(sortieRequest)

        // The count should have decreased by one as it was saved and the undo had no changes to undo
        XCTAssertEqual(events.count, 5, "Wrong amount of Events remaining.")

        // cascade delete of the event should delete teh associated sorties.
        XCTAssertEqual(sorties.count, events.count * 3, "Wrong amount of Sorties remaining.")

        dataController.delete(events.first!)
        events = try context.fetch(eventRequest)
        sorties = try context.fetch(sortieRequest)

        XCTAssertEqual(events.count, 4, "Wrong amount of Events remaining.")

        // cascade delete of the event should delete the associated sorties.
        XCTAssertEqual(sorties.count, events.count * 3, "Wrong amount of Sorties remaining.")

        dataController.delete(sorties.first!)
        dataController.save()

        events = try context.fetch(eventRequest)
        sorties = try context.fetch(sortieRequest)

        // deleting a sortie should not delete the event
        XCTAssertEqual(sorties.count, (events.count * 3) - 1, "Wrong amount of Sorties remaining.")
        XCTAssertEqual(events.count, 4, "Wrong amount of Events remaining.")

        dataController.deleteAllEvents()

        events = try context.fetch(eventRequest)
        sorties = try context.fetch(sortieRequest)

        XCTAssertEqual(events.count, 0, "There should be no events.")
        XCTAssertEqual(sorties.count, 0, "There should be no events.")

        _ = Event(context: context)

        events = try context.fetch(eventRequest)
        sorties = try context.fetch(sortieRequest)

        XCTAssertEqual(events.count, 1, "There should be one event.")
        XCTAssertEqual(sorties.count, 0, "There should be no sorties.")

    }

    func testDiskDataControllerCreation() {
        let diskDataController = DataController()
        XCTAssertTrue(diskDataController.container.persistentStoreDescriptions.first!.url!.absoluteString.contains("file"))

    }

}
