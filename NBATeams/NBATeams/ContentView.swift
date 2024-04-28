//
//  ContentView.swift
//  NBATeams
//
//  Created by Micah Moore on 4/17/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var teamApp = NBATeamViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($teamApp.teams) { $team in
                    NavigationLink(destination: TeamDetailView(team: $team)) {
                        Text(team.name)
                    }
                }
            }
            .navigationTitle("NBA Teams")
        }
        .onAppear {
            teamApp.fetchData()
        }
        .refreshable {
            teamApp.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
