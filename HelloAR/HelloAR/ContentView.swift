//
//  ContentView.swift
//  HelloAR
//
//  Created by Harun Gunes on 23/07/2022.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        return ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        arView.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator().handleTap)))
        context.coordinator.view = arView
        arView.session.delegate = context.coordinator
        
        // Anchor
        let anchor = AnchorEntity(plane: .horizontal)

        // Model entities
        let box = ModelEntity(mesh: MeshResource.generateBox(size: 0.3), materials: [SimpleMaterial(color: .blue, isMetallic: true)])
        box.generateCollisionShapes(recursive: true)
        
        let sphere = ModelEntity(mesh: MeshResource.generateSphere(radius: 0.3), materials: [SimpleMaterial(color: .green, isMetallic: true)])
        sphere.position = simd_make_float3(0, 0.4, 0)
        
        let plane = ModelEntity(mesh: MeshResource.generatePlane(width: 0.5, depth: 0.3), materials: [SimpleMaterial(color: .red, isMetallic: true)])
        plane.position = simd_make_float3(0, 0.7, 0)
        
        let text = ModelEntity(mesh: MeshResource.generateText("Hello AR", extrusionDepth: 0.03, font: .systemFont(ofSize: 0.2), containerFrame: .zero, alignment: .center, lineBreakMode: .byCharWrapping), materials: [SimpleMaterial(color: .brown, isMetallic: true)])
        
//        anchor.addChild(text)
//        anchor.addChild(plane)
//        anchor.addChild(sphere)
        anchor.addChild(box)
        
        arView.scene.anchors.append(anchor)
        
        return arView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
