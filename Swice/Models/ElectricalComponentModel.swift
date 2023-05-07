//
//  ElectricalComponent.swift
//  Swice
//
//  Created by Jonathan Enking on 01.05.23.
//

import Foundation
import SwiftUI

class ElectricalComponent:Codable,Identifiable,Hashable{
    public func hash(into hasher: inout Hasher) {
             hasher.combine(ObjectIdentifier(self))
    }
    
   
    
    var id = UUID()
    var name:String
    var src:String
    var nodes:[String]
    var values:[String]
    var position:[Int]
    var nodePositions:[[Int]]
    init(name: String, nodes: [String],values:[String],position:[Int],src:String,nodePositions:[[Int]]) {
        self.name = name
        self.nodes = nodes
        self.values = values
        self.position = position
        self.src = src
        self.nodePositions = nodePositions
    }
}
extension ElectricalComponent:Equatable{
    public static func ==(lhs: ElectricalComponent, rhs: ElectricalComponent) -> Bool {
           return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
       }
}
