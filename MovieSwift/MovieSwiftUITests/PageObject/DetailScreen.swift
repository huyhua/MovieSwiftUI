//
//  DetailScreen.swift
//  MovieSwiftUITests
//
//  Created by Huy Hua on 20/06/2022.
//  Copyright © 2022 Thomas Ricouard. All rights reserved.
//

import Foundation
import XCTest

struct DetailScreen: Screen {
    let app: XCUIApplication
    
    var duration: Int {
        let element = app.staticTexts["Runtime"].firstMatch
        let runtime = element.label.split(separator: " ")[0]
        print("Movie run time is \(runtime) minutes")
        return Int(runtime) ?? 0
    }
    
    func waitForScreen() {
    }
}
