//
//  editDayView.swift
//  yardwork
//
//  Created by bobby cheema on 13/10/2023.
//

//import SwiftUI
//import SwiftData
//
//struct editDayView: View {
//    
//    @Environment(\.modelContext) private var modelContext
//    @Environment(\.dismiss) private var dismiss
//    
//    let   day: Days
//    
//    //    private var numberFromText: NumberFormatter{
//    //        
//    //        let mynumber = NumberFormatter()
//    //        mynumber.numberStyle = .none
//    //        return mynumber
//    //    }
//    
//    
//    
// 
//
//    
////    @State private var newStartKms:  Int
////    private var newStartKmsString: Binding<String> {
////        Binding<String>(
////            get: {String(self.newStartKms)},
////            set: { self.newStartKms = Int($0) ?? 0 }
////            
////        )
////    }
//    
// 
//    
//    var body: some View {
//        VStack {
//            
//            Text("Start Date: \(day.startDay, style: .date)").font(.headline)
//            Text("Truck Rego : \(day.truckRego)")
//            HStack{
//                Text(" Start Time: \(day.startDay, style: .time)")
//                Spacer()
//                Text(" Finish Time: \(day.finishDay, style: .time)")
//            }
//            HStack{
//                Text(" Start Kms : \(day.startKms)")
//                Spacer()
//                Text(" Finish Kms : \(day.finishKms)")
//            }
//        }
////        Form{
////            
////            Section("Start Kms \(day.startKms)") {
////                TextField("New Start Kms ", text: newStartKmsString).keyboardType(.numberPad)
////            }
////        }
//        
//        
//        
//    }
//    
//    
//}
