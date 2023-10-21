//
//  dayView.swift
//  yardwork
//
//  Created by bobby cheema on 4/10/2023.
//

import SwiftUI
import SwiftData
struct dayView: View {
    var day: Days
    @State private var isaddingJobs: Bool = false
    @State private var isEditingJob: Bool = false
    //@State private var jobBeingEdited: Jobs?
    var body: some View {
        
        VStack{
            
            
            
            Text("Date: \(day.startDay, style: .date)").font(.headline).padding(.bottom)
            
            HStack{
                Text(" Start Time: \(day.startDay, style: .time)")
                Spacer()
                Text(" Finish Time: \(day.finishDay, style: .time)")
            }
            HStack{
                Text(" Start Kms : \(day.startKms)")
                Spacer()
                Text(" Finish Kms : \(day.finishKms)")
            }
            HStack{
                Text("Truck Rego : \(day.truckRego)")
                Spacer()
                //                Button {
                NavigationLink("Edit Day"){
                    //                        editDayView(day: day )
                    editDayView(day: day)
                }
                //
                //                } label: {
                //                    Text("Edit Day")
                //                }
                
                
            }
            
            
            
            
            
            Section("Job Details ") {
                
                List {
                    ForEach(0..<day.job.count, id: \.self) { index in
                        let job = day.job[index]
                        Section(header: HStack{
                            Text("Job \(index + 1)")
                            Spacer()
                            NavigationLink("Edit Job"){
                                editJob(job: job)
                                
                            }
                            
                        } ) {
                            Text(" BC:  \(job.bc)")
                            Text("Trailer: \(job.trailer)")
                            Text("Project No: \(job.project)")
                            Text("Notes: \(job.notes)")
                            Text("Start time:  \(job.startTime, formatter: Self.timeFormatter)")
                            Text("Finish time:   \(job.finishTime, formatter:  Self.timeFormatter)")
                        }
                    }
                }
                
            }
            
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    addJobView(day: day)
                } label: {
                    Text("Add jobs")
                }
                
            }
            
        }
        
        //        , job: Jobs(bc: "", trailer: "", notes: "", startTime: Date.now, finishTime: Date.now)
        
        
        
    }
    static let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
}
//
//#Preview {
//    dayView(Days(startDay: Date(), finishDay: Date()))
//}

struct editJob:View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    let job: Jobs
    @State private var newbc: String
    @State private var newtrailer: String
    @State private var newnote: String
    @State private var newstart: Date
    @State private var newfinish: Date
    @State private var newproject: String
    init(job: Jobs) {
        self.job = job
        _newbc = State(initialValue: job.bc)
        _newtrailer = State(initialValue: job.trailer)
        _newnote = State(initialValue: job.notes)
        _newstart = State(initialValue: job.startTime)
        _newfinish = State(initialValue: job.finishTime)
        _newproject = State(initialValue: job.project)
    }
    var body: some View {
        VStack{
            Form{
                Section {
                    TextField("New Bc", text: $newbc, prompt: Text("BC"))
                } header: {
                    Text("Birth Certificate")
                }
                Section {
                    TextField("Trailer", text:  $newtrailer)
                } header: {
                    Text("Trailer")
                }
                Section {
                    TextField("New Note", text: $newnote)
                } header: {
                    Text("Discription")
                }
                
                Section {
                    DatePicker("start Time", selection: $newstart, displayedComponents: .hourAndMinute)
                } header: {
                    Text("Start Time")
                }
                Section {
                    DatePicker("Finish Time", selection: $newfinish, displayedComponents: .hourAndMinute)
                } header: {
                    Text("Finish Time")
                }
                Section {
                    TextField("NewProject", text: $newproject)
                } header: {
                    Text("Project No")
                }
                
                
                
                //            HStack{
                //                Text("\(day.truckRego)")
                //                TextField("New Truck Rego ", text: $newTruckRego, prompt: Text("Truck Rego"))
                //            }
                
                
            }.navigationTitle("Updating Day")
            HStack{
                Spacer()
                Button("Update") {
                    print("updating new values")
                    job.bc = newbc
                    job.trailer = newtrailer
                    job.notes = newnote
                    job.startTime = newstart
                    job.finishTime =  newfinish
                    job.project =   newproject
                    
                    
                    do {
                        try  modelContext.save()
                        dismiss()
                    } catch {
                        print(error.localizedDescription)
                        
                        
                    }
                    
                }
            }
        }
        
        
    }
}

struct editDayView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    let   day: Days
    
    //    private var numberFromText: NumberFormatter{
    //
    //        let mynumber = NumberFormatter()
    //        mynumber.numberStyle = .none
    //        return mynumber
    //    }
    
    @State private var newStartDay: Date
    @State private var newFinishDay: Date
    @State private var newStartKms: Int
    @State private var newFinishKms: Int
    @State private var newTruckRego: String
    
    init(day: Days) {
        self.day = day
        _newStartDay = State(initialValue: day.startDay)
        _newFinishDay = State(initialValue: day.finishDay)
        _newStartKms = State(initialValue: day.startKms)
        _newFinishKms = State(initialValue: day.finishKms)
        _newTruckRego = State(initialValue: day.truckRego)
    }
    
    
    //    @State private var newStartKms:  Int
    //    private var newStartKmsString: Binding<String> {
    //        Binding<String>(
    //            get: {String(self.newStartKms)},
    //            set: { self.newStartKms = Int($0) ?? 0 }
    //
    //        )
    //    }
    
    var body: some View {
        VStack {
            
            Text("Start Date: \(day.startDay, style: .date)").font(.headline)
            Text("Truck Rego : \(day.truckRego)")
            HStack{
                Text(" Start Time: \(day.startDay, style: .time)")
                Spacer()
                Text(" Finish Time: \(day.finishDay, style: .time)")
            }
            HStack{
                Text(" Start Kms : \(day.startKms)")
                Spacer()
                Text(" Finish Kms : \(day.finishKms)")
            }
        }.padding()
        Form{
            Section {
                TextField("New Truck Rego ", text: $newTruckRego, prompt: Text("Truck Rego"))
            } header: {
                Text("Truck Rego")
            }
            Section {
                TextField("Start Kms", value: $newStartKms, format: .number)
            } header: {
                Text("Start Kms")
            }
            Section {
                TextField("Finish Kms", value: $newFinishKms, format: .number)
            } header: {
                Text("Finish Kms")
            }
            
            Section {
                DatePicker("start Time", selection: $newStartDay, displayedComponents: .hourAndMinute)
            } header: {
                Text("Start Time")
            }
            Section {
                DatePicker("Finish Time", selection: $newFinishDay, displayedComponents: .hourAndMinute)
            } header: {
                Text("Finish Time")
            }
            //            HStack{
            //                Text("\(day.truckRego)")
            //                TextField("New Truck Rego ", text: $newTruckRego, prompt: Text("Truck Rego"))
            //            }
            
            
        }.navigationTitle("Updating Day")
        HStack{
            Spacer()
            Button("Update") {
                print("updating new values")
                day.startDay = newStartDay
                day.finishDay = newFinishDay
                day.startKms = newStartKms
                day.finishKms = newFinishKms
                //                _newTruckRego = State(initialValue: day.truckRego)
                do {
                    try  modelContext.save()
                } catch {
                    print(error.localizedDescription)
                    
                    
                }
                
            }
        }
        //        Form{
        //
        //            Section("Start Kms \(day.startKms)") {
        //                TextField("New Start Kms ", text: newStartKmsString).keyboardType(.numberPad)
        //            }
        //        }
        //
        
        
    }
    func updatenow(){
        print("updating new values")
        day.startDay = newStartDay
        day.finishDay = newFinishDay
        day.startKms = newStartKms
        day.finishKms = newFinishKms
        //                _newTruckRego = State(initialValue: day.truckRego)
        do {
            try  modelContext.save()
        } catch {
            print(error.localizedDescription)
        }
        
        
        
    }
    
    
}
