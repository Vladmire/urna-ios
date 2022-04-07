//
//  ReviewsProvider.swift
//  urna
//
//  Created by imac44 on 07.04.2022.
//

import Foundation

class ReviewsProvider {
    
    private let reviews = [Review(userID: 1, pointID: 1, rating: 3, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore                        magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in                               reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia                          deserunt mollit anim id est laborum"),
                           Review(userID: 2, pointID: 1, rating: 4, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum")]
    
    func getReviews(completion: @escaping ([Review]?, Error?) -> Void) {
        // TODO: download review for API
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            completion(self.reviews, nil)
        }
    }
    
}
