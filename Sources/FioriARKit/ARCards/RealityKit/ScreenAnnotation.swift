//
//  ScreenAnnotation.swift
//
//
//  Created by O'Brien, Patrick on 3/16/21.
//

import CoreGraphics
import RealityKit
import SwiftUI

/// Wrapper struct for the **CardItem : CardItemModel**  and the real world anchoring position. Used to set the internal entity.

public struct ScreenAnnotation<CardItem: CardItemModel>: Identifiable, Equatable {
    public var id: CardItem.ID {
        self.card.id
    }
    
    public var card: CardItem
    
    public internal(set) var markerState: MarkerControl.State
    
    internal var entity: Entity?
    internal var screenPosition: CGPoint?
    
    internal var isCardVisible: Bool {
        self.entity != nil
    }
    
    public init(card: CardItem) {
        self.card = card
        self.markerState = .notVisible
    }
    
    internal mutating func updateCardPosition() {
        self.card.position_ = self.entity?.position
    }
    
    internal mutating func setScreenPosition(to position: CGPoint?) {
        self.screenPosition = position
        if position == nil {
            self.setMarkerState(to: .notVisible)
        }
    }
    
    internal mutating func setMarkerState(to state: MarkerControl.State) {
        if self.markerState != .world, state == .world {
            self.showInternalEntity()
        }
        if self.markerState == .world, state != .world {
            self.hideInternalEntity()
        }
        self.markerState = state
    }
    
    internal mutating func setEntity(to entity: Entity?) {
        self.entity = entity
        self.updateCardPosition()
        self.hideInternalEntity()
    }
    
    internal mutating func removeEntity() {
        self.setMarkerState(to: .normal)
        self.entity?.removeFromParent()
        self.setScreenPosition(to: nil)
        self.setEntity(to: nil)
        self.updateCardPosition()
    }
    
    internal mutating func removeEntityFromScene() {
        self.updateCardPosition()
        self.entity?.removeFromParent()
    }
    
    private func hideInternalEntity() {
        self.entity?.components[ModelComponent.self] = ModelComponent(mesh: MeshResource.generateSphere(radius: 0.03), materials: [OcclusionMaterial()])
    }
    
    private func showInternalEntity() {
        self.entity?.components[ModelComponent.self] = ModelComponent(mesh: MeshResource.generateSphere(radius: 0.03), materials: [SimpleMaterial(color: .red, isMetallic: false)])
    }
}
