//
//  Item.swift
//  yardwork
//
//  Created by bobby cheema on 4/10/2023.
//

import Foundation
import SwiftData

@Model
final class Days  {
    var startDay: Date
    var finishDay: Date
    var startKms: Int = 0
    var finishKms: Int = 0
    var truckRego: String = ""
    @Relationship( deleteRule: .cascade,  inverse:  \Jobs.workedOn) var job: [Jobs] = []
    
    init(startDay: Date, finishDay: Date, startKms: Int, finishKms: Int, truckRego: String, job: [Jobs]) {
        self.startDay = startDay
        self.finishDay = finishDay
        self.startKms = startKms
        self.finishKms = finishKms
        self.truckRego = truckRego
        self.job = job
    }
    
    
//    init(startDay: Date, finishDay: Date, job: [Jobs]) {
//        self.startDay = startDay
//        self.finishDay = finishDay
//        self.job = job
//    }
}


@Model
final class Jobs {
    var bc: String
    var trailer: String
    var notes : String
    var startTime: Date
    var finishTime: Date
    var project: String
    var workedOn : Days?
    
    init(bc: String, trailer: String, notes: String, startTime: Date, project: String, finishTime: Date) {
        self.bc = bc
        self.trailer = trailer
        self.notes = notes
        self.startTime = startTime
        self.finishTime = finishTime
        self.project = project
    }
    
//    init(bc: String, trailer: String, notes: String, startTime: Date, finishTime: Date, workedOn: Days? = nil) {
//        self.bc = bc
//        self.trailer = trailer
//        self.notes = notes
//        self.startTime = startTime
//        self.finishTime = finishTime
//        self.workedOn = workedOn
//    }
}
