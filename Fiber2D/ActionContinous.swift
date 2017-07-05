//
//  ActionContinous.swift
//  Fiber2D
//
//  Created by Andrey Volodin on 03.09.16.
//  Copyright © 2016 s1ddok. All rights reserved.
//

public struct ActionContinousContainer: ActionContainer, Continous {
    
    mutating public func update(with target: Node, state: Float) {
        action.update(with: target, state: state)
    }
    
    public mutating func start(with target: Node) {
        elapsed = 0
        action.start(with: target)
    }
    
    public mutating func stop(with target: Node) {
        action.stop(with: target)
    }
    
    public mutating func step(with target: Node, dt: Time) {
        elapsed += dt
        
        self.update(with: target, state: max(0, // needed for rewind. elapsed could be negative
            min(1, elapsed / max(duration, Float.ulpOfOne)) // division by 0
            )
        )
    }
    
    public var tag: Int = 0
    private(set) public var duration: Time = 0.0
    private(set) public var elapsed:  Time = 0.0

    public var isDone: Bool {
        return elapsed > duration
    }
    
    private(set) public var action: ActionModel
    public init(action: ActionModel, duration: Time) {
        self.action = action
        self.duration = duration
    }
    
}

public extension ActionModel {
    public func continously(duration: Time) -> ActionContinousContainer {
        return ActionContinousContainer(action: self, duration: duration)
    }
}
