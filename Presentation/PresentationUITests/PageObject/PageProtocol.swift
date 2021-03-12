//
//  PageProtocol.swift
//  PresentationUITests
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 12/03/21.
//

import XCTest

protocol Page {
    var app: XCUIApplication { get }

    init(app: XCUIApplication)
}
