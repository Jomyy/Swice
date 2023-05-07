//
//  ElectricalComponentView.swift
//  Swice
//
//  Created by Jonathan Enking on 01.05.23.
//

import SwiftUI

struct ElectricalComponentView: View {
    
    var componentViewModel:ElectricalComponent
    
    @State var i:Int
    @State var unitSpacing:CGFloat
    @Binding var projectFile:ProjectFileModel
    var body: some View {
        VStack{
            GeometryReader{geo in
                Image("Components/ElementaryDevices/Resistor").resizable().position(x:-unitSpacing / geo.size.width,y: -unitSpacing / geo.size.height)
         
                 ForEach(componentViewModel.nodePositions,id: \.self){val in
                     Circle().fill(.opacity(0)).frame(width:8,height:8).position(x:unitSpacing * CGFloat(val[0]),y:unitSpacing * CGFloat(val[1]) )
                     Circle().fill(.black).frame(width:2,height:2).position(x:unitSpacing * CGFloat(val[0]),y:unitSpacing * CGFloat(val[1]) )
                 }
             
                
                
                
               
            }.frame(width:unitSpacing * 4, height:unitSpacing * 4,alignment: .center).onTapGesture {
                projectFile.selectedComponent = i
                
            }
        }
        
        
        
    }
}


