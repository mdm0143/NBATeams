//
//  Team.swift
//  NBATeams
//
//  Created by Micah Moore on 4/17/24.
//

import Foundation
import FirebaseFirestoreSwift

struct NBATeamModel: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String
    var city: String
    var topPlayers: [String]  // Names of top three players
    var record: String
    var arena: String
}
