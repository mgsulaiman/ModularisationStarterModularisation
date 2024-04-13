//
//  DependencyContainerRegistrationType.swift
//
//
//  Created by mgsulaimanCom on 12/04/2024.
//
import Foundation
public enum DependencyContainerRegistrationType {
    case singleInstance(AnyObject)
    case closureBased(() -> Any)
}
