//
//  UserDefaultsManager.swift
//  Lesson 5
//
//  Created by user1 on 16.09.2023.
//

import Foundation

final class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    private let userDefaults = UserDefaults.standard
    private let personKey = "people"
    
    func savePersonToUserDefaults(person: Person) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(person) {
            userDefaults.set(encoded, forKey: personKey)
        }
    }
    
    func loadPersonFromUserDefaults() -> Person? {
        if let savedPersonData = userDefaults.data(forKey: personKey) {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(Person.self, from: savedPersonData) {
                return loadedPerson
            }
        }
        return nil
    }
}

