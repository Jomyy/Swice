//
//  ContentView.swift
//  Swice
//
//  Created by Jonathan Enking on 01.05.23.
//

import SwiftUI

struct ContentView: View {
    @Binding var projectFile: ProjectFileModel

   
    var body: some View {
        EditorView(projectFile:$projectFile).frame(maxWidth:.infinity,maxHeight: .infinity)
    }
}


