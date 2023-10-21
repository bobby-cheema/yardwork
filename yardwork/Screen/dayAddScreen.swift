//
//  dayAddScreen.swift
//  yardwork
//
//  Created by bobby cheema on 6/10/2023.
//

import SwiftUI

struct dayAddScreen: View {
    @Environment(\.modelContext) private var modelContext
    @State private  var start: Date = Date.now
    @State private  var finish: Date = Date.now
    @State private  var truckRego: String = ""
    @State private var startkms: Int = 0
    @State private var finishkms: Int = 0
//    @Binding private var finish: Date
//    @Binding private var startKms: Int
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        HStack{
            Section{
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                }
                Spacer()
                Button {
                    //do something than  dismiss
                    addDay()
                    dismiss()
                } label: {
                    Text("Save")
                }
                
            }
        }
            
            VStack{
                if start ==  start {
                    Text("\(start)")
                }
               
                Spacer()
                Form{
                   DatePicker("Start Time", selection: $start)
                    DatePicker("Finish Time", selection: $finish)
                    TextField("Truck Rego", text: $truckRego)
                }
            }
            
           
       
    }
    
        private func addDay() {
            withAnimation {
                let newItem = Days(startDay: start, finishDay: finish, startKms: startkms, finishKms: finishkms, truckRego: truckRego , job: [])
    
    //                               job: [Jobs(bc: "123004", trailer: "wkt 07", notes: " testing ", startTie: Date(), finishTime: Date())])
                modelContext.insert(newItem)
            }
        }
    
}
//#Preview {
//    dayAddScreen()
//}
