//
//  ArtistDetailGateway.swift
//
//
//  Created by mgsulaimanCom on 12/04/2024.
//
import ArtistDetailInterface
import UIKit
public struct ArtistDetailGateway: ArtistDetailInterface {
    public init() {
        
    }
    public func makeArtistDetailModule(navigationController: UINavigationController?, artistIdentifier: String) -> UIViewController {
        let coordinator = ArtistDetailsCoordinator(navigationController: navigationController)
        return coordinator.makeViewController(artistIdentifier: artistIdentifier)
    }
}
