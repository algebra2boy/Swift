//
//  UserDefaultPlaying.swift
//  WorkExperiment
//
//  Created by Yongye Tan on 7/24/23.
//

import SwiftUI

struct UserDefaultPlaying: View {

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    print("HELLO")
                    print(UserDefaults.abeditionIsStarredDict)
                    
                } label: {
                    Text("printing")
                }
                Spacer()
                
                Spacer()
                Button {
                    var dict = UserDefaults.abeditionIsStarredDict
                    
                    dict["Edition\(Int.random(in: 6...10000))-yongye"] = Bool.random()
                    
                    
                    UserDefaults.abeditionIsStarredDict = dict
                    
                } label: {
                    Text("Add ")
                }
                Spacer()
                
                Button {
                    var dict = UserDefaults.abeditionIsStarredDict
                        
                    dict.removeValue(forKey: "Edition48- 5314BE21-5687-4E82-8D37-18BEDC6737AF")
                    
                    UserDefaults.abeditionIsStarredDict = dict
                    
                } label: {
                    Text("Remove")
                }
                
                Button {
                    var dict = UserDefaults.abeditionIsStarredDict
                    
                    dict["Edition8172-yongye"]?.toggle()
                    
                    UserDefaults.abeditionIsStarredDict = dict
                    
                } label: {
                    Text("Override")
                }
                
                Button {
                    var dict = UserDefaults.abeditionIsStarredDict
                    
                    let found = UserDefaults.abeditionIsStarredDict.contains { $0.key == "Edition812-yongye"}
                    print(found)
                    
                } label: {
                    Text("Found?")
                }
                Spacer()
                
                
            }
            
            List {
                Text("Printing all isStarred")
                
                
                
            }
        }
        
    }
    
}

struct UserDefaultPlaying_Previews: PreviewProvider {
    
    static var previews: some View {
        UserDefaultPlaying()
    }
}

extension UserDefaults {
    
    private enum Keys {
        static let isStarred = "abedition - isStarred"
    }
    
//    func isStarredDict(forKey key: String) -> Bool {
//        return object(forKey: key) != nil
//    }
    
    class var abeditionIsStarredDict: [String: Bool] {
        get {
            return UserDefaults.standard.object(forKey: Keys.isStarred) as? [String: Bool] ?? [:]
        } set {
            UserDefaults.standard.set(newValue, forKey: Keys.isStarred)
        }
    }
    
}

