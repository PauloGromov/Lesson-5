import Foundation
class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    private let userDefaults = UserDefaults.standard
    private let peopleKey = "people"
    
    func savePeopleToUserDefaults(people: [Person]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(people) {
            userDefaults.set(encoded, forKey: peopleKey)
        }
    }
    
    func loadPeopleFromUserDefaults() -> [Person]? {
        if let savedPeopleData = userDefaults.data(forKey: peopleKey) {
            let decoder = JSONDecoder()
            if let loadedPeople = try? decoder.decode([Person].self, from: savedPeopleData) {
                return loadedPeople
            }
        }
        return nil
    }
}
