//
//  ContentView.swift
//  Swice
//
//  Created by Jonathan Enking on 01.05.23.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: SwiceDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(SwiceDocument()))
    }
}
