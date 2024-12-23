//
//  MissionView.swift
//  Moonshot
//
//  Created by Saverio Negro on 09/12/24.
//

import SwiftUI

struct MissionView: View {
    
    let mission: Mission
    let astronauts: [String : Astronaut]
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    let crew: [CrewMember]
    
    init(mission: Mission, astronauts: [String : Astronaut] = Bundle.main.decode("astronauts.json")) {
        
        self.mission = mission
        self.astronauts = astronauts
        
        self.crew = mission.crew.map { member in
            let role = member.role
            
            guard let astronaut = astronauts[member.name] else {
                fatalError("Missing \(member.name)")
            }
            
            return CrewMember(role: role, astronaut: astronaut)
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        return width * 0.6
                    }
                    .padding(.top)
                
                Text("\(mission.formattedLaunchDateComplete)")
                    .padding(.top)
                
                VStack(alignment: .leading) {
                    CustomDividerView()
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                    CustomDividerView()
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                
                AstronautsScrollView(crew: crew)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

#Preview {
    
    let missions: Array<Mission> = Bundle.main.decode("missions.json")
    let astronauts: Dictionary<String, Astronaut> = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
