//
//  MissionsView.swift
//  Moonshot
//
//  Created by Saverio Negro on 23/12/24.
//

import SwiftUI

struct MissionsView: View {
    
    let missions: [Mission]
    
    var body: some View {
        ForEach(missions) { mission in
            NavigationLink(value: mission) {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding()
                    
                    VStack {
                        Text(mission.displayName)
                            .font(.headline)
                            .foregroundStyle(.white)
                        Text(mission.formattedLaunchDate)
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.5))
                    }
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(Color.lightBackground)
                }
                .clipShape(.rect(cornerRadius: 10))
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.lightBackground)
                }
            }
        }
    }
}

#Preview {
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    MissionsView(missions: missions)
}
