//
//  ShoppingCartFunction.swift
//  CourseWorkUI
//
//  Created by Udara PC on 2024-04-12.
import Foundation

// Example object conforming to Codable
struct OrderObject: Codable, Hashable {
    var cloth_id: Int
    var quantity: Int
    var total: Int
    // Add other properties as needed
}

// Storing array of objects in UserDefaults
func storeObjects(_ objects: [OrderObject]) {
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(objects) {
        UserDefaults.standard.set(encoded, forKey: "objectsArray")
    }
}

// Adding objects to the array and storing in UserDefaults
func addObject(_ object: OrderObject) {
    var objectsArray = retrieveObjects()
    objectsArray.append(object)
    storeObjects(objectsArray)
}

// Retrieving array of objects from UserDefaults
func retrieveObjects() -> [OrderObject] {
    if let data = UserDefaults.standard.data(forKey: "objectsArray") {
        let decoder = JSONDecoder()
        if let decoded = try? decoder.decode([OrderObject].self, from: data) {
            return decoded
        }
    }
    return [] // Return empty array if there's no data or decoding fails
}

func removeObject(at index: Int) {
    var objectsArray = retrieveObjects()
    objectsArray.remove(at: index)
    storeObjects(objectsArray)
}
