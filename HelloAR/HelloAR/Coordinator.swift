//
//  Coordinator.swift
//  HelloAR
//
//  Created by Harun Gunes on 23/07/2022.
//

import Foundation
import ARKit
import RealityKit

class Coordinator: NSObject, ARSessionDelegate {
    
    weak var view: ARView?
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let view = self.view else { return }

        let tapLocation = sender.location(in: view)
        
        if let entity = view.entity(at: tapLocation) as? ModelEntity {
            let material = SimpleMaterial(color: .green, isMetallic: false)
            entity.model?.materials = [material]
        }
    }
}
