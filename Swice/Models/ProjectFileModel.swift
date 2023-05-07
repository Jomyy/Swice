//
//  ProjectFileModel.swift
//  Swice
//
//  Created by Jonathan Enking on 01.05.23.
//

import Foundation
struct ProjectFileModel:Codable,Equatable{
    var electricalComponents:[ElectricalComponent] = []
    var description:String = ""
    var name:String = ""
    var canvasSize = 50
    var selectedComponent = -1
    init(electricalComponents:[ElectricalComponent],description:String,name:String){
        self.electricalComponents = electricalComponents
        self.description = description
        self.name = name
    }
}
