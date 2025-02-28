//
//  mission.swift
//  Moonshot
//
//  Created by noor on 2/25/25.
//

import Foundation

struct Mission : Codable, Identifiable {
    struct CrewRole : Codable {
        let name: String
        let role : String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var missionTitle : String {
        "Apollo \(id)"
    }
    
    var missionImage : String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "MA"
    }
}
