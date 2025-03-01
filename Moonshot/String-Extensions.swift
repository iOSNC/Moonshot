//
//  String-Extensions.swift
//  Moonshot
//
//  Created by noor on 2/28/25.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}
