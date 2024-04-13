//
//  Artist.swift
//
//
//  Created by mgsulaimanCom on 12/04/2024.
//
import CommonModels
import Foundation

public struct Artist: Codable {
    public let name: String
    public let birthDate: Date
    public let songs: [Song]
}
