//
//  TeamViewModel.swift
//  NBATeams
//
//  Created by Micah Moore on 4/17/24.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class NBATeamViewModel: ObservableObject {
    
    @Published var teams = [NBATeamModel]()
    let db = Firestore.firestore()
    
    func fetchData() {
        self.teams.removeAll()
        db.collection("nbaTeams")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        do {
                            self.teams.append(try document.data(as: NBATeamModel.self))
                        } catch {
                            print(error)
                        }
                    }
                }
            }
    }
    
    func saveData(team: NBATeamModel) {
        if let id = team.id {
            let docRef = db.collection("nbaTeams").document(id)
            docRef.updateData([
                "name": team.name,
                "city": team.city,
                "topPlayers": team.topPlayers,
                "record": team.record,
                "arena": team.arena
            ]) { err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
            }
        } else {
            db.collection("nbaTeams").addDocument(data: [
                "name": team.name,
                "city": team.city,
                "topPlayers": team.topPlayers,
                "record": team.record,
                "arena": team.arena
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document successfully added")
                }
            }
        }
    }
}
