//
//  addJobView.swift
//  yardwork
//
//  Created by bobby cheema on 4/10/2023.
//

import SwiftUI
import SwiftData

struct addJobView: View {
    
   let day: Days
    
//
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var bc:String = ""
    @State private var trailer:String = ""
    @State private var note:String = ""
    @State private var start:Date = Date.now
    @State private var finish:Date = Date.now
    @State private var project: String = ""
    var body: some View {
        Form{
            Section ("Timings"){
                DatePicker("Start time", selection: $start, displayedComponents: .hourAndMinute).datePickerStyle(.graphical)
                DatePicker("Finish time ", selection: $finish, displayedComponents: .hourAndMinute)
                
            }
            Section("Test") {
                
                TextField("BC", text: $bc)
                TextField("Trailer Number ", text: $trailer)
                TextField("Description", text: $note)
                TextField("Project", text: $project)
            }
            
            
            
        }
        .navigationTitle("Adding Job")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    print("WRITING")
                    let job = Jobs(bc: bc, trailer: trailer, notes: note, startTime: start, project: project, finishTime: finish)
                    job.workedOn = day
                    modelContext.insert(job)
                    do{
                        try modelContext.save()
                        day.job.append(job)
                        dismiss()
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                } label: {
                    Text("SAVE")
                }
                
            }
        }
    }
    
   
    
}
//
//#Preview {
//    addJobView()
//}
