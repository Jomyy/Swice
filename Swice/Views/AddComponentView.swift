//
//  AddComponentView.swift
//  Swice
//
//  Created by Jonathan Enking on 01.05.23.
//

import SwiftUI

struct AddComponentView: View {
   
    
    @Binding var projectFile:ProjectFileModel
    let rows = [
        GridItem(.adaptive(minimum:120)),
        GridItem(.adaptive(minimum:120))
        ]
    var body: some View {
        ScrollView(){
            HStack(alignment: .top){
                LazyVGrid(columns:rows,alignment: .center){
                    ForEach(1...40,id:\.self){val in
                        Image("Components/ElementaryDevices/Resistor").onTapGesture {
                           
                            
                            projectFile.electricalComponents.append( ElectricalComponent(name: "R1", nodes: ["1","2"], values: ["100k"], position: [300,200],src:"Components/ElementaryDevices/Resistor", nodePositions: [[0,2],[0,-2]]))
                            
                            
                            
                        }
                    }
                   
                  
                   
                }.listStyle(.sidebar).frame(width:300).frame(maxHeight:.infinity)
            }
            
        }
       
      
    }
}
