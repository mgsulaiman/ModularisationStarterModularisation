//
//  TemporaryMainTargetGateway.swift
//  ModularisationStarter
//
//  Created by mgsulaimanCom on 12/04/2024.
//
import CommonModels
import TemporaryMainPackageInterface
import SongDetailsInterface
import DependencyContainer

import UIKit
struct TemporaryMainTargetGateway: TemporaryMainPackageInterface {
    func makeSongDetailModule(navigationController: UINavigationController?, song: CommonModels.Song) -> UIViewController {
        let gateway = DC.shared.resolve(type: .closureBased, for: SongDetailsInterface.self)
        return gateway.makeSongDetailsModule(navigationController: navigationController, song: song)
    }
}
