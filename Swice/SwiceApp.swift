//
//  SwiceApp.swift
//  Swice
//
//  Created by Jonathan Enking on 01.05.23.
//

import SwiftUI

@main
struct SwiceApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: SwiceDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
