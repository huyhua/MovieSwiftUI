//
//  MovieSwiftUITests.swift
//  MovieSwiftUITests
//
//  Created by Huy Hua on 20/06/2022.
//  Copyright © 2022 Thomas Ricouard. All rights reserved.
//

import XCTest

class MovieSwiftUITests: XCTestCase {
    
    var home: HomeScreen!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        let app = XCUIApplication()
        app.launch()
        home = HomeScreen(app: app)
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNowShowingMovie() throws {
        // UI tests must launch the application that they test.
        let movie = home.getItem(by: "Jurassic World Dominion")
            
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(movie.description, "Four years after Isla Nublar was destroyed, dinosaurs now live—and hunt—alongside humans all over the world. This fragile balance will reshape the future and determine, once and for all, whether human beings are to remain the apex predators on a planet they now share with history’s most fearsome creatures.")
        XCTAssertEqual(movie.title, "Jurassic World Dominion")
    }
    
    func testSearchSpiderManMovie() {
        home.search("Spider Man")
            
        
        XCTAssertGreaterThan(home.items.count, 0)
        XCTAssert(home.getItem(by: 0).description.contains("Spider-Man"))
    }
}
