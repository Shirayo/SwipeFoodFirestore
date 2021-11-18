//
//  CardViewModel.swift
//  SwipeFoodFirestore
//
//  Created by Vasily Mordus on 2.11.21.
//

import Foundation
import UIKit
import SDWebImage

protocol ProdusesCardViewModel {
    func toCardViewModel() -> CardViewModel
}

class CardViewModel {
    // we'll define the properties that are view will display/ render out
    
    let imageUrls: [String]
    let attibuterdText: NSAttributedString
    let textAligment: NSTextAlignment
    
    var imageIndexObserver: ((Int, URL) -> ())?
    
    fileprivate var imageIndex = 0 {
        didSet {
            let imageName = imageUrls[imageIndex]
            if let url = URL(string: imageName) {
                imageIndexObserver?(imageIndex, url)
            }
        }
    }
    
    init(imageNames: [String], attibuterdText: NSAttributedString, textAligment: NSTextAlignment) {
        self.imageUrls = imageNames
        self.attibuterdText = attibuterdText
        self.textAligment = textAligment
    }
    
    func advanceNextPhoto() {
        imageIndex = min(imageIndex + 1, imageUrls.count - 1)
    }
    
    func goToPreviousPhoto() {
        imageIndex = max(imageIndex - 1, 0)
    }
    
}
