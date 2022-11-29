//
//  FileStoring.swift
//  MyMovies
//
//  Created by Aurimas Bavarskis on 29/11/2022.
//

import Foundation
import OrderedCollections

protocol FileStoring {
    associatedtype Item: Codable & Identifiable & Hashable

    var storagePath: URL { get }
    func store(items: [Item]) throws
    func removeAll() throws
    func remove(item: Item) throws
    func retrieveAll() throws -> [Item]
    func retrieve(id: Item.ID) throws -> Item
}

extension FileStoring {
    func store(items: [Item]) throws {
        var existing: [Item] = []

        do {
            existing = try retrieveAll()
        } catch {
            print("did not find any items")
        }

        let newArray = items + existing
        let set = OrderedSet(newArray)

        let data = try JSONEncoder().encode(set)
        try data.write(to: storagePath, options: .completeFileProtection)
    }

    func removeAll() throws {
        let empty: [Item] = []
        let data = try JSONEncoder().encode(empty)
        try data.write(to: storagePath, options: .completeFileProtection)
    }

    func remove(item: Item) throws {
        do {
            var existing = try retrieveAll()
            if let index = existing.firstIndex(where: { $0.id == item.id }) {
                existing.remove(at: index)
                try removeAll()
                try store(items: existing)
            } else {
                throw CoreError.generic
            }
        } catch {
            print("did not find any items")
        }
    }

    func retrieveAll() throws -> [Item]  {
        let data = try Data(contentsOf: storagePath)
        return try JSONDecoder().decode([Item].self, from: data)
    }

    func retrieve(id: Item.ID) throws -> Item {
        let all = try retrieveAll()
        if let found = all.filter({ $0.id == id }).first {
            return found
        } else {
            throw CoreError.generic
        }
    }
}
