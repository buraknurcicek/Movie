//
//  BaseProtocol.swift
//  Movie
//
//  Created by Burak Nurçiçek on 14.09.2022.
//

protocol GenericValueProtocol {
    associatedtype Value
    var value: Value { get }
}
