//
//  Mootshot.swift
//  Moonshot
//
//  Created by Yongye Tan on 4/5/23.
//

import SwiftUI

struct Mootshot: View {
    // since it would return the generic type, we would need to explict indicate the return type
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    // construct a gridItem
    let column = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            // scrollable
            ScrollView {
                // only load when it is needed
                LazyVGrid(columns: column) {
                    // for each mission, create a navigational link
                    ForEach(missions) { mission in
                        // go to another page
                        NavigationLink {
                            Text("Detail view")
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                    Text(mission.launchDate ?? "N/A")
                                        .font(.caption)
                                }
                                .frame(maxWidth: .infinity)
                            }
                        }
                    }
                }
            }
            // navigationTitle should be placed inside not outside
            .navigationTitle("Mootshot")
        }
    }
}

struct Mootshot_Previews: PreviewProvider {
    static var previews: some View {
        Mootshot()
    }
}
