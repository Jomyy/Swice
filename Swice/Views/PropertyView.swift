//
//  PropertyView.swift
//  Swice
//
//  Created by Jonathan Enking on 01.05.23.
//

import SwiftUI

struct PropertyView: View {
    
    @Binding var projectFile:ProjectFileModel
   
    var body: some View {
        ScrollView{
            HStack(alignment: .top){
                if(projectFile.selectedComponent != -1){
                    VStack(alignment: .center){
                        TextField("Name",text:$projectFile.electricalComponents[projectFile.selectedComponent].name)
                        
                        ForEach($projectFile.electricalComponents[projectFile.selectedComponent].values,id:\.count){$val in
                          
                            TextField("Property",text:$val)
                                
                                
                               
                                
                            }
                        
                        
                        
                        
                    }
                    
                    
                }else{
                    Text("No Component Selcted")
                }
            }
        }
       
       
       
    }
    
}

