//
//  Coordinator.swift
//  HelloAR
//
//  Created by Harun Gunes on 15/08/2022.
//

import Foundation
import ARKit
import RealityKit
import Combine

class Coordinator: NSObject, ARSessionDelegate {
    
    weak var view: ARView?
    var cancellable: AnyCancellable?
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        guard let view = self.view else { return }

        let tapLocation = sender.location(in: view)
        let results = view.raycast(from: tapLocation, allowing: .estimatedPlane, alignment: .horizontal)
        
        if let result = results.first {
            
//            let anchor = ARAnchor(name: "Plane Anchor", transform: result.worldTransform) //ARKit
//            view.session.add(anchor: anchor)
            
            let material = SimpleMaterial(color: UIColor.random(), isMetallic: false)
            let modelEntity = ModelEntity(mesh: MeshResource.generateBox(size: 0.3), materials: [material])
            modelEntity.generateCollisionShapes(recursive: true)
            
//            let anchorEntity = AnchorEntity(anchor: anchor) // RealityKit
//            anchorEntity.addChild(modelEntity)
            
            let anchorEntity = AnchorEntity(raycastResult: result) // RealityKit
            anchorEntity.addChild(modelEntity)
            
            view.scene.addAnchor(anchorEntity)
            view.installGestures(.all, for: modelEntity)
        }
        
        
        
        /// To interact with an existing model entity
//        if let entity = view.entity(at: tapLocation) as? ModelEntity {
//            let material = SimpleMaterial(color: .random(), isMetallic: false)
//            entity.model?.materials = [material]
//        }
        
    }
    
    //: MARK: - 3D modeling
    
    @objc func models3D(_ sender: UITapGestureRecognizer) {
        guard let view = self.view else { return }
        
        guard view.scene.anchors.first(where: {$0.name == "HabEn"}) == nil else {
            return
        }
        
        let tapLocation = sender.location(in: view)
        let results = view.raycast(from: tapLocation, allowing: .estimatedPlane, alignment: .horizontal)
        
        if let result = results.first {
            
            let anchor = AnchorEntity(raycastResult: result)
  
            /// 3D models without animation
            
//            cancellable = ModelEntity.loadAsync(named: "fender_stratocaster")
//                .append(ModelEntity.loadAsync(named: "toy_car"))
//                .collect()
//                .sink { loadCompletion in
//                    if case let .failure(error) = loadCompletion {
//                        print("\(error)")
//                    }
//
//                    self.cancellable?.cancel()
//                } receiveValue: { entities in
//
//                    entities.forEach { entity in
//                        var x: Float = 0.0
//
//                        entity.position = simd_make_float3(x, 0, 0)
//
//                        anchor.name = ""
//                        anchor.addChild(entity)
//
//                        x += 0.3
//                    }
//                }
            
            /// 3D models without animation `.reality`
            
            cancellable = ModelEntity.loadAsync(named: "hab_en")
                .sink { loadCompletion in
                    if case let .failure(error) = loadCompletion {
                        print("\(error)")
                    }
                    
                    self.cancellable?.cancel()
                } receiveValue: { entity in
                        anchor.name = "HabEn"
                        anchor.addChild(entity)
                    
                }
            
            
            
            view.scene.addAnchor(anchor)
        }

    }
}
