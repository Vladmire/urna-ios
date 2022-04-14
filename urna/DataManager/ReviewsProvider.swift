//
//  ReviewsProvider.swift
//  urna
//
//  Created by imac44 on 07.04.2022.
//

import Foundation

class ReviewsProvider {
    
    // MARK: - review's array
    
    private let reviews = [Review(userID: 1, image: "accIcon", name: "Gosha", pointID: 1, rating: 4, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
                           Review(userID: 2, image: "accIcon", name: "Gosha", pointID: 2, rating: 3, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
                           Review(userID: 3, image: "accIcon", name: "Gosha", pointID: 3, rating: 4, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
                           Review(userID: 4, image: "accIcon", name: "Gosha", pointID: 4, rating: 5, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
                           Review(userID: 5, image: "accIcon", name: "Gosha", pointID: 5, rating: 2, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
                           Review(userID: 6, image: "accIcon", name: "Gosha", pointID: 6, rating: 1, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
                           Review(userID: 7, image: "accIcon", name: "Gosha", pointID: 1, rating: 4, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
                           Review(userID: 8, image: "accIcon", name: "Gosha", pointID: 2, rating: 5, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
                           
                           Review(userID: 1, image: "accIcon", name: "Gosha", pointID: 3, rating: 4, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
                           Review(userID: 2, image: "accIcon", name: "Gosha", pointID: 4, rating: 3, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
                           Review(userID: 3, image: "accIcon", name: "Gosha", pointID: 5, rating: 4, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
                           Review(userID: 4, image: "accIcon", name: "Gosha", pointID: 6, rating: 5, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
                           Review(userID: 5, image: "accIcon", name: "Gosha", pointID: 1, rating: 2, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
                           Review(userID: 6, image: "accIcon", name: "Gosha", pointID: 2, rating: 1, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
                           Review(userID: 7, image: "accIcon", name: "Gosha", pointID: 3, rating: 4, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
                           Review(userID: 8, image: "accIcon", name: "Gosha", pointID: 4, rating: 5, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ")]
                           
    
    // MARK: - sort reviews
    
    func searchReviews(currentValue: Int, reviews: [Review]) -> [Review] {
        var sortedreviews: [Review] = []
        for review in reviews {
            if review.pointID == currentValue {
                sortedreviews.append(review)
            }
        }
        return sortedreviews
    }
    
    // MARK: - push reviews
    
    func getReviews(currentPoint: Int, completion: @escaping ([Review]?, Error?) -> Void) {
        // TODO: download review for API
        let sortedReviews = searchReviews(currentValue: currentPoint, reviews: reviews)
        
        completion(sortedReviews, nil)
    
    }
    
}
