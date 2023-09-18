//
//  delegate.swift
//  Lesson 5
//
//  Created by user1 on 16.09.2023.
import Foundation

protocol PersonDelegate: AnyObject {
    func didAddPerson(_ person: Person)
}
