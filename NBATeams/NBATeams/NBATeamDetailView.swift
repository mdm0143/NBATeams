//
//  NBATeamDetailView.swift
//  NBATeams
//
//  Created by Micah Moore on 4/17/24.
//

import SwiftUI

struct TeamDetailView: View {
    @Binding var team: NBATeamModel
    @ObservedObject var teamApp = NBATeamViewModel()

    var body: some View {
        List {
            Section(header: Text("Edit Team Info")) {
                TextField("Team Name", text: $team.name)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                TextField("City", text: $team.city)
                    .font(.system(size: 20))
            }

            Section(header: Text("Team Details")) {
                Text("Arena: \(team.arena)")
                Text("Record: \(team.record)")
                Text("Top Players:")
                ForEach(team.topPlayers, id: \.self) { player in
                    Text(player)
                }
            }
        }
        .navigationTitle(team.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    teamApp.saveData(team: team)
                    // Optionally reset the team details if necessary
                } label: {
                    Text("Save")
                }
            }
        }
    }
}
