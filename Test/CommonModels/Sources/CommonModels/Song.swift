//
//  Song.swift
//
//
//  Created by mgsulaimanCom on 12/04/2024.
//

import Foundation
public struct Song: Codable, Hashable {
    public let id: String
    public let name: String
    public let artistName: String
    public let artistIdentifier: String
    public let lyrics: String
    public init(id: String, name: String, artistName: String, artistIdentifier: String, lyrics: String) {
        self.id = id
        self.name = name
        self.artistName = artistName
        self.artistIdentifier = artistIdentifier
        self.lyrics = lyrics
    }
}
