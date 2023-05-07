//
//  SwiceDocument.swift
//  Swice
//
//  Created by Jonathan Enking on 01.05.23.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var swiceCircuit: UTType {
        UTType(importedAs: "com.jonny.swice-circuit")
    }
}

struct SwiceDocument: FileDocument,Equatable {
    static func == (lhs: SwiceDocument, rhs: SwiceDocument) -> Bool {
        return false
    }
    
    
    var projectfile: ProjectFileModel
 
    init(projectfile: ProjectFileModel){
        self.projectfile = projectfile
      
        
    }

    static var readableContentTypes: [UTType] { [.swiceCircuit] }

    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        
        projectfile = try JSONDecoder().decode(ProjectFileModel.self, from: string.data(using: .utf8)!)
        projectfile.electricalComponents.forEach{i in
            print(i.position)
        }
       
    }
    func snapshot(contentType: UTType) throws -> ProjectFileModel {
        projectfile// Make a copy.
    }
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let encoder = JSONEncoder()
        let data = try encoder.encode(projectfile)
        
        return .init(regularFileWithContents: data)
    }
}
