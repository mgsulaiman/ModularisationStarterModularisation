//
//  File.swift
//  
//
//  Created by mgsulaimanCom on 12/04/2024.
//

import CommonModels
import UIKit
import SongDetailsInterface
public struct SongDetailsGateway: SongDetailsInterface {
    public init() {
        
    }
    public func makeSongDetailsModule(navigationController: UINavigationController?, song: CommonModels.Song) -> UIViewController {
        let coordinator = SongDetailsCoordinator(navigationController: navigationController)
        return coordinator.makeViewController(with: song)
    }
}
