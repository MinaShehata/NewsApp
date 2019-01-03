//
//  CoreDataStack.swift
//  Dog Walk
//
//  Created by Mina Shehata Gad on 5/18/18.
//  Copyright © 2018 Razeware. All rights reserved.
//

import CoreData

final class CoreDataStack {
    
    static let shared = CoreDataStack(modelName: "IntermediateTrainingModel")
    
    private let modelName: String
    private init(modelName: String) {
        self.modelName = modelName
    }
    // this is the managed coordinator and managed Object Model and context together
    lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: modelName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                print(error.localizedDescription)
            }
        })
        return container
    }()
    
    ///MARK: master Managed Context accessor here...
    lazy var masterContext: NSManagedObjectContext = {
        var mastercon = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        mastercon.parent = mainContext
        mastercon.automaticallyMergesChangesFromParent = true
        return mastercon
    }()
    
    //MARK: Managed Context accessor here...
    var mainContext: NSManagedObjectContext {
        return storeContainer.viewContext
    }
    
}

// MARK:- Utility functions.....
extension CoreDataStack {
    func saveMainContext() {
        guard mainContext.hasChanges else { return }
        do {
            try mainContext.save()
        }
        catch let error  {
            print(error.localizedDescription)
        }
    }
    
    func saveMasterContext() {
        guard masterContext.hasChanges else { return }
        do {
            try masterContext.save()
        }
        catch let error  {
            print(error.localizedDescription)
        }
    }
}
