//
//  ContentView.swift
//  yardwork
//
//  Created by bobby cheema on 4/10/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var days: [Days]
    @State private var isAddingDay: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(days) { item in
                    NavigationLink {
                        
                        dayView(day: item)
                    } label: {
                        Text(item.startDay, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }.navigationTitle("Yard Work")
                .toolbar {
                    ToolbarItem {
                        Button(action: {
                            addDay()
                        }) {
                            Image(systemName: "plus")
                        }
                    }
                }
                .sheet(isPresented: $isAddingDay) {
//                    dayAddScreen(start: Date())
//
                    dayAddScreen()
                    
                    
                }
            
            
        }
        
        
        
        //    private func addItem() {
        //        withAnimation {
        //            let newItem = Days(startDay: Date(), finishDay: Date())
        //
        ////                               job: [Jobs(bc: "123004", trailer: "wkt 07", notes: " testing ", startTie: Date(), finishTime: Date())])
        //            modelContext.insert(newItem)
        //        }
        //    }
    }
    private func addDay() {
        isAddingDay = true
    }
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(days[index])
            }
        }
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: Days.self, inMemory: true)
}
