//
//  ModelData.swift
//  Landmarks
//
//  Created by Cory McCabe on 10/29/24.
//

import Foundation

@Observable
    class ModelData {
        var landmarks: [Landmark] = load("landmarkData.json")
    }

/// This Function is for reading json data.
/// >Experiment: Don't be afriad to explore new ways of solving problems. Get creative. This is just one way this can be done.
/// - Parameter filename: The parameter is a **filename**, which you'll point the **filename** with relevant data. Before declaring this function, you'll make a class with an array variable that calls this **load** function with the **("TheNameOfYourFile.json").**
/// 
/// - Returns: This will give you decoded data from file that you pass in with a string, which will ultimately be your **data** variable. This also returns fatalError messages.
///
///     '''swift
///  @Observable
///     class ModelData {
///         var landmarks: [Landmark] = load("landmarkData.json")
///     }
///
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
    
}
