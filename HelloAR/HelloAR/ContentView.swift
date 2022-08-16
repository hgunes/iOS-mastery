//
//  ContentView.swift
//  HelloAR
//
//  Created by Harun Gunes on 14/08/2022.
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
        
        let anchor = AnchorEntity(plane: .horizontal)
        let material = SimpleMaterial(color: UIColor.random(), isMetallic: true)
        let box = ModelEntity(mesh: MeshResource.generateBox(size: 0.3), materials: [material])
        box.generateCollisionShapes(recursive: true)
        
//        let sphere = ModelEntity(mesh: MeshResource.generateSphere(radius: 0.3), materials: [SimpleMaterial(color: .red, isMetallic: false)])
//        sphere.position = simd_make_float3(0, 0.4, 0)
        
//        let text = ModelEntity(mesh: MeshResource.generateText("Vampsheen Knight", extrusionDepth: 0.3, font: .systemFont(ofSize: 0.5), containerFrame: .zero, alignment: .center, lineBreakMode: .byCharWrapping), materials: [material])
//
//        anchor.addChild(text)
        //
        anchor.addChild(box)
//        anchor.addChild(sphere)
        
        
        
        arView.scene.addAnchor(anchor)
        
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
