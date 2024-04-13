// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation
public typealias DC = DependencyContainer
public final class DependencyContainer {
    public static let shared = DependencyContainer()
    private var singleInstanceDependencies: [ObjectIdentifier: AnyObject] = [:]
    private var closureBasedDependencies: [ObjectIdentifier: () -> Any] = [:]
    private let dependencyAccessQueue = DispatchQueue(label: "com.mgsulaiman.yallaUni.dependency.access.queue", attributes: .concurrent)
    private init() {
        
    }
    public func register(type: DependencyContainerRegistrationType, for interface: Any.Type) {
        dependencyAccessQueue.sync(flags: .barrier){
            let objectIdentifier = ObjectIdentifier(interface)
            switch type {
            case .singleInstance(let instance):
                singleInstanceDependencies[objectIdentifier] = instance
            case .closureBased(let closure):
                closureBasedDependencies[objectIdentifier] = closure
            }
        }
    }
    public func resolve<Value>(type: DependencyContainerResolvingType, for interface: Value.Type) -> Value {
        var value: Value!
        dependencyAccessQueue.sync {
            let objectIdentifier = ObjectIdentifier(interface)
            switch type {
            case .singleInstance:
                guard let singleInstanceDependency = singleInstanceDependencies[objectIdentifier] as? Value else {
                    fatalError("Could not retrieve a dependency for the give type: \(interface)")
                }
                return value = singleInstanceDependency
            case .closureBased:
                guard let closure = closureBasedDependencies[objectIdentifier], let closureBasedDependency = closure() as? Value else {
                    fatalError("Could not retrieve a closure based dependency for the give type: \(interface)")
                }
                value = closureBasedDependency
            }
        }
        return value
    }
}
