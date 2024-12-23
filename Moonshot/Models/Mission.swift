//
//  Mission.swift
//  Moonshot
//
//  Created by Saverio Negro on 07/12/24.
//

import Foundation

struct Mission: Hashable, Codable, Identifiable {
    
    struct CrewRole: Codable, Hashable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    var image: String {
        return "apollo\(self.id)"
    }
    var displayName: String {
        return "Apollo \(self.id)"
    }
    var formattedLaunchDate: String {
        return self.launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    var formattedLaunchDateComplete: String {
        return self.launchDate?.formatted(date: .complete, time: .omitted) ?? "N/A"
    }
}
