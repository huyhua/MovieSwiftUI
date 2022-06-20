//
//  Screen.swift
//  MovieSwiftUITests
//
//  Created by Huy Hua on 20/06/2022.
//  Copyright © 2022 Thomas Ricouard. All rights reserved.
//

import Foundation
import XCTest

protocol Screen {
    var app: XCUIApplication { get }
    
    func waitForScreen()
}
