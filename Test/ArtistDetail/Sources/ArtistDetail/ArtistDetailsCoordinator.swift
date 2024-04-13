//
//  ArtistDetailsCoordinator.swift
//  ModularisationStarter
//
//  Created by Emre Havan on 13.02.24.
//

import SwiftUI
import AnalyticsInterface
import CommonModels
import DependencyContainer
import TemporaryMainPackageInterface
final class ArtistDetailsCoordinator {

    private weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func makeViewController(artistIdentifier: String) -> UIViewController {
        let analyticsTracker = DC.shared.resolve(type: .singleInstance, for: AnalyticsEventTracking.self)
        let view = ArtistDetailsView(
            viewModel: .init(
                artistService: ArtistService(),
                analyticsTracker: analyticsTracker,
                artistIdentifier: artistIdentifier,
                onSongSelected: pushSongDetail(_:)
            )
        )
        let hostingVC = UIHostingController(rootView: view)
        return hostingVC
    }

    func pushSongDetail(_ song: Song) {
        let gateway = DC.shared.resolve(type: .closureBased, for: TemporaryMainPackageInterface.self)
        let songDetailView = gateway.makeSongDetailModule(navigationController: navigationController, song: song)
        navigationController?.pushViewController(songDetailView, animated: true)
    }
}
