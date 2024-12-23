//
//  ContentView.swift
//  Moonshot
//
//  Created by Saverio Negro on 02/12/24.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String : Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var missionsView: some View {
        MissionsView(missions: missions)
    }
    
    var grid: some View {
        
        let columns = [
            GridItem(.adaptive(minimum: 150))
        ]
        
        return ScrollView {
            LazyVGrid(columns: columns) {
                missionsView
            }
            .padding([.horizontal, .bottom])
        }
    }
    
    var list: some View {
        List {
            missionsView
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
        }
        .scrollContentBackground(.hidden)
    }
    
    @State var showingList = false
    
    var showingOptionButtonLabel: String {
        return showingList ? "Show as grid" : "Show as list"
    }
    var showingOptionButtonImage: String {
        return showingList ? "square.grid.2x2" : "list.bullet"
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if showingList {
                    list
                } else {
                    grid
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .navigationDestination(for: Mission.self) { mission in
                MissionView(mission: mission)
            }
            .toolbar {
                Button("\(showingOptionButtonLabel)", systemImage: "\(showingOptionButtonImage)") {
                    showingList.toggle()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
