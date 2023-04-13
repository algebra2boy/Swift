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
                                    .padding(.vertical)
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(mission.displayDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                // lightBackground is a color but we customize it in the Color-Theme
                                .background(.lightBackground)
                            }
                            // make the bottom box looks like a rectangular box
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            // overlay makes the entire box to a rectangular
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                                )
                        }
                    }
                }
                // add padding horizontally and bottom between each grids
                // works well only being added in the scrollview
                .padding([.horizontal, .bottom])
                
            }
            
            // navigationTitle should be placed inside not outside
            .navigationTitle("Mootshot")
            .background(.darkBackground)
            // turn on only the dark mode (very cool)
            .preferredColorScheme(.dark)
        }
    }
}

struct Mootshot_Previews: PreviewProvider {
    static var previews: some View {
        Mootshot()
    }
}
