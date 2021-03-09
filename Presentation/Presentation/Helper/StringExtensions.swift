//
//  StringExtensions.swift
//  Presentation
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 8/03/21.
//

import Foundation

extension String {

var containsValidCharacter: Bool {
    guard self != "" else { return true }
    let hexSet = CharacterSet(charactersIn: "1234567890ABCDEFGHIJKLMNÑOPQRSTUVWXYZ")
    let newSet = CharacterSet(charactersIn: self)
    return hexSet.isSuperset(of: newSet)
  }
}
