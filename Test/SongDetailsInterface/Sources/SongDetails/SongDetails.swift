// The Swift Programming Language
// https://docs.swift.org/swift-book

import CommonModels
import UIKit

public protocol SongDetailsInterface {
    func makeSongDetailsModule(navigationController: UINavigationController?, song: Song) -> UIViewController
}
