//
//  EditorView.swift
//  Swice
//
//  Created by Jonathan Enking on 01.05.23.
//

import SwiftUI

struct EditorView: View {
    @Binding var projectFile : ProjectFileModel
    
    
    var body: some View {
        HStack(spacing:CGFloat(1)){
            
            AddComponentView(projectFile:$projectFile).frame(width:300).frame(maxHeight:.infinity)
            InteractiveCanvas(projectFile:$projectFile).frame(maxWidth: .infinity,maxHeight: .infinity).border(.black,width: 1)
            PropertyView(projectFile: $projectFile).frame(width:300).frame(maxHeight: .infinity).padding()
        }
        
    }
}

