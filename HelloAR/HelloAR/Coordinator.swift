//
//  Coordinator.swift
//  HelloAR
//
//  Created by Harun Gunes on 15/08/2022.
//

import Foundation
import ARKit
import RealityKit

class Coordinator: NSObject, ARSessionDelegate {
    
    weak var view: ARView?
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let view = self.view else { return }

        let tapLocation = sender.location(in: view)
        let results = view.raycast(from: tapLocation, allowing: .estimatedPlane, alignment: .horizontal)
        
        if let result = results.first {
            
//            let anchor = ARAnchor(name: "Plane Anchor", transform: result.worldTransform) //ARKit
//            view.session.add(anchor: anchor)
            
            let material = SimpleMaterial(color: UIColor.random(), isMetallic: false)
            let modelEntity = ModelEntity(mesh: MeshResource.generateBox(size: 0.3), materials: [material])
            
//            let anchorEntity = AnchorEntity(anchor: anchor) // RealityKit
//            anchorEntity.addChild(modelEntity)
            
            let anchorEntity = AnchorEntity(raycastResult: result) // RealityKit
            anchorEntity.addChild(modelEntity)
            
            view.scene.addAnchor(anchorEntity)
        }
        
        /// To interact with an existing model entity
//        if let entity = view.entity(at: tapLocation) as? ModelEntity {
//            let material = SimpleMaterial(color: .random(), isMetallic: false)
//            entity.model?.materials = [material]
//        }
        
    }
}
