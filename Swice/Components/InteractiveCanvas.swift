//
//  InteractiveCanvas.swift
//  Swice
//
//  Created by Jonathan Enking on 01.05.23.
//

import SwiftUI
import Cocoa
import Introspect

struct InteractiveCanvas: View {
    
  
    @Binding var projectFile:ProjectFileModel
    var body: some View {
        VStack(alignment:.center){
            HStack(alignment: .center){
                GeometryReader{wholeSize in
                    ScrollView([.vertical,.horizontal],showsIndicators:true){
                        GeometryReader{size in
                            ForEach(1...projectFile.canvasSize,id: \.self){val in
                                Rectangle().fill(.gray.opacity(0.3)).frame(width:size.size.width,height:1).position(x:size.size.width / 2,y:size.size.height / CGFloat(projectFile.canvasSize) * CGFloat(val))
                            }
                            ForEach(1...projectFile.canvasSize,id: \.self){val in
                                Rectangle().fill(.gray.opacity(0.3)).frame(width:1,height:size.size.height).position(x:size.size.width / CGFloat(projectFile.canvasSize) * CGFloat(val),y:size.size.height / 2)
                            }
                            
                                ForEach(Array(zip(projectFile.electricalComponents.indices,projectFile.electricalComponents )),id:\.0){i,component in
                                    
                                   
                                    let spacing = size.size.height / CGFloat(projectFile.canvasSize)
                                    ElectricalComponentView(componentViewModel:component, i:i,unitSpacing: spacing,projectFile:$projectFile).position(x:CGFloat(component.position[0]).snapTo(snapUnit:spacing),y:CGFloat(component.position[1]).snapTo(snapUnit:spacing)).coordinateSpace(name: "componentSpace").gesture(DragGesture(minimumDistance:0,coordinateSpace:.named("canvasSpace")).onChanged{val in
                                        
                                        component.position = [Int(val.location.x ),Int(val.location.y)]
                                        projectFile.selectedComponent = projectFile.selectedComponent
                                        
                                    })
                                }
                            
                            
                        }.frame(width:700,height:700).background(.white).coordinateSpace(name: "canvasSpace")
                    }.introspectScrollView { scrollView in
                        scrollView.verticalScrollElasticity = NSScrollView.Elasticity.none
                        scrollView.horizontalScrollElasticity = NSScrollView.Elasticity.none
                        
                        
                       
                        
                       
                        scrollView.usesPredominantAxisScrolling = false
                    }.frame(width:wholeSize.size.width,height:wholeSize.size.height)
                }.frame(maxWidth:.infinity,maxHeight:.infinity)
                
            }.frame(maxWidth:.infinity,maxHeight:.infinity)
           
        }.frame(maxWidth:.infinity,maxHeight:.infinity)
           
        
        
        
    }
}
extension CGFloat{
    func snapTo(snapUnit:CGFloat) -> CGFloat{
        return CGFloat(snapUnit * (self / snapUnit).rounded())
    }
}
