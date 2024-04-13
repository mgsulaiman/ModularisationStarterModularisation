//
//  AppDependencyConfigurer.swift
//  ModularisationStarter
//
//  Created by mgsulaimanCom on 12/04/2024.
//

import ArtistDetail
import ArtistDetailInterface
import AnalyticsInterface
import Analytics
import DependencyContainer
import Foundation
import TemporaryMainPackageInterface
import SongDetails
import SongDetailsInterface
enum AppDependencyConfigurer {
    static func configure() {
        // MARK: - Analytics Registration
        let analyticsTracker = AnalyticsEventTracker()
        DC.shared.register(type: .singleInstance(analyticsTracker), for: AnalyticsEventTracking.self)
        // MARK: - Artist Detail Registration
        let artistDetailClosure: () -> ArtistDetailInterface = {
            ArtistDetailGateway()
        }
        DC.shared.register(type: .closureBased(artistDetailClosure), for: ArtistDetailInterface.self)
        // MARK: - Temporary Package Registration
        let temporaryGatewayClosure: () -> TemporaryMainPackageInterface = {
            TemporaryMainTargetGateway()
        }
        DC.shared.register(type: .closureBased(temporaryGatewayClosure), for: TemporaryMainPackageInterface.self)
        // MARK: - Song Details Registration
        let songDetailsClosure: () -> SongDetailsInterface = {
            SongDetailsGateway()
        }
        DC.shared.register(type: .closureBased(songDetailsClosure), for: SongDetailsInterface.self)
    }
}
