//
//  PointsProvider.swift
//  urna
//
//  Created by imac44 on 06.04.2022.
//

import Foundation

class PointsProvider {
    
    private let points = [Point(pointID: 1,
                                name: "campus A",
                                type: [.batteries, .paper, .plastic],
                                location: "Chekhov Street, 22 Taganrog Rostov Oblast Russia 347922",
                                image: "campusA",
                                schedule: "пн. - пт. 9:30 - 17:00",
                                rating: 4),
                          
                          Point(pointID: 2,
                                name: "campus B",
                                type: [.bio, .paper, .plastic],
                                location: "Chekhov Street, 24 Taganrog Rostov Oblast Russia 347922",
                                image: "campusB",
                                schedule: "пн. - пт. 9:30 - 17:00",
                                rating: 3),
                          
                          Point(pointID: 3,
                                name: "campus V",
                                type: [.bio, .paper, .plastic],
                                location: "Petrovskaya Street, 81 Taganrog Rostov Oblast Russia 347900",
                                image: "campusV",
                                schedule: "пн. - пт. 9:30 - 17:00",
                                rating: 3),
                          
                          Point(pointID: 4,
                                name: "Campus G",
                                type: [.bio, .paper, .plastic],
                                location: "Engelsa Street, 1 Taganrog, Rostov Oblast Russia 347922",
                                image: "campusG",
                                schedule: "пн. - пт. 9:30 - 17:00",
                                rating: 4),
                          
                          Point(pointID: 5,
                                name: "campus D",
                                type: [.batteries, .paper, .plastic],
                                location: "Nekrasovskiy Lane, 44 Taganrog, Rostov Oblast Russia 347928",
                                image: "campusD",
                                schedule: "пн. - пт. 9:30 - 17:00",
                                rating: 3),
                          
                          Point(pointID: 6,
                                name: "campus I",
                                type: [.batteries, .paper, .plastic],
                                location: "Chekhov Street, 2 Taganrog Rostov Oblast Russia 347922",
                                image: "campusI",
                                schedule: "пн. - пт. 9:30 - 17:00",
                                rating: 3)]
    
    
    
    func getPoints(completion: @escaping ([Point]?, Error?) -> Void) {
        // TODO: download points for API
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            completion(self.points, nil)
        }
    }
    
}
