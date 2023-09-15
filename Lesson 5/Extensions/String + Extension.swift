//  String + Extension.swift
//  Lesson 5
//
//  Created by user1 on 15.09.2023.

import Foundation

extension String {
    
    func getFirstSumbols() -> String {
        self.split(separator: " ")
            .prefix(2)
            .reduce("", {$0 + String($1[$1.startIndex]) })
    }
}
