//
//  SwiceApp.swift
//  Swice
//
//  Created by Jonathan Enking on 01.05.23.
//

import SwiftUI
import Introspect
@main
struct SwiceApp: App {
    
    var body: some Scene {
        
        DocumentGroup(newDocument: SwiceDocument(projectfile: ProjectFileModel(electricalComponents: [ElectricalComponent(name: "R1", nodes: ["1","2"], values: ["100k"], position: [30,19],src:"Components/ElementaryDevices/Resistor", nodePositions: [[0,2],[0,-2]])], description: "TestCircuit", name: "TestCircuit"))) { file in
            
            ContentView(projectFile: file.$document.projectfile)
        }.windowToolbarStyle(.expanded).windowStyle(.titleBar)
        
    }
}
