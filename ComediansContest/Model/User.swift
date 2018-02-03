//
//  User.swift
//  ComediansContest
//

import FirebaseFirestore
import FirebaseCore

let USER_REF = "user"

class User {
    let id: String
    let name: String

    init(id: String, name: String) {
        self.id = id
        self.name = name
    }

    // TODO: insert contents
    // TODO: insert icon data, nickname
    // TODO: error handling
    static func insert(id: String, name: String) {
        //        userRef?.collection("test").document("docTest").collection("keigo").document()
        Firestore.firestore().collection(USER_REF).document(id).setData([
            "name": name,
            //            "icon": Data(),
        ], completion: { error in
            if let error = error {
                print(error)
            }
        })
    }
}
