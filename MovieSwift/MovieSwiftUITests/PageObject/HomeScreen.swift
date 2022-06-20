//
//  HomePage.swift
//  MovieSwiftUITests
//
//  Created by Huy Hua on 20/06/2022.
//  Copyright © 2022 Thomas Ricouard. All rights reserved.
//

import Foundation
import XCTest


struct HomeScreen: Screen {
    let app: XCUIApplication
    
    var items: XCUIElementQuery {
        app.collectionViews.descendants(matching: .button).matching(identifier: "MovieItem")
    }
    
    var searchField: XCUIElement {
        app.otherElements["SearchField"].textFields.firstMatch
    }
    
    func getItem(by index: Int = 0) -> MovieItem {
        return MovieItem(items.element(boundBy: index))
    }
    
    func getItem(by title: String) -> MovieItem {
        return MovieItem(items.containing(NSPredicate(format: "label == '\(title)'")).firstMatch)
    }
    
    @discardableResult
    mutating func search(_ term: String) -> Self {
        searchField.tap()
        searchField.typeText(term + XCUIKeyboardKey.return.rawValue)
        
        let expect = XCTNSPredicateExpectation(predicate: NSPredicate(format: "count > 0"), object: items)
        XCTWaiter().wait(for: [expect], timeout: 10)
        return self
    }
    
    func waitForScreen() {
        _ = searchField.waitForExistence(timeout: 10)
    }
    
    
}

struct MovieItem {
    let wrapper: XCUIElement
    var title: String {
        wrapper.staticTexts["MovieTitle"].firstMatch.label
    }
    var description: String {
        wrapper.staticTexts["MovieDescription"].firstMatch.label
    }
    
    init(_ wrapper: XCUIElement) {
        self.wrapper = wrapper
    }
    
    func goToMovieDetail() {
        wrapper.tap()
    }
}
