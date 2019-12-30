 
 
 import Foundation
 
 struct JSONFile {
    private static let libraryPath = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first!
    
    /// Tries to load a persisted value from a JSON file.
    static func loadValue<T: Codable>(named name: String) throws -> T {
        let fileURL = URL(fileURLWithPath: libraryPath).appendingPathComponent("\(name).json")
        let data = try Data(contentsOf: fileURL)
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    /// Persist an object on disk as a JSON file.
    static func save<T: Codable>(value: T, named name: String) throws {
        let data = try JSONEncoder().encode(value)
        let fileURL = URL(fileURLWithPath: libraryPath).appendingPathComponent("\(name).json")
        try data.write(to: fileURL)
    }
 }
