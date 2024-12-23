//
//  AstronautsScrollView.swift
//  Moonshot
//
//  Created by Saverio Negro on 23/12/24.
//

import SwiftUI

struct AstronautsScrollView: View {
    
    let crew: Array<MissionView.CrewMember>
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay {
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                }
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let mission = missions[1]
    let crew = mission.crew.map { member in
        
        let role = member.role
        guard let astronaut = astronauts[member.name] else {
            fatalError("Missing \(member.name)")
        }
        
        return MissionView.CrewMember(role: role, astronaut: astronaut)
    }
    
    AstronautsScrollView(crew: crew)
        .preferredColorScheme(.dark)
}
