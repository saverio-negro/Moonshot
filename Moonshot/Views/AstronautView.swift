//
//  AstronautView.swift
//  Moonshot
//
//  Created by Saverio Negro on 10/12/24.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
            
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    
    let astronauts: [String : Astronaut] = Bundle.main.decode("astronauts.json")
    let astronaut = astronauts["white"]!
    return AstronautView(astronaut: astronaut)
        .preferredColorScheme(.dark)
}
