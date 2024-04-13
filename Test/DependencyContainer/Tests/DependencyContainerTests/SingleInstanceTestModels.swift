//
//  SingleInstanceTestModels.swift
//
//
//  Created by mgsulaimanCom on 12/04/2024.
//
import Foundation
protocol SingleInstanceProtocol: AnyObject {
    func sampleMethod()
}
final class SingleInstanceImplementation: SingleInstanceProtocol {
    func sampleMethod() {
        
    }
}
