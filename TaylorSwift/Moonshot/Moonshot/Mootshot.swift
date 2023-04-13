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
    var body: some View {
        Text("\(astronauts.count)")
        Text("\(missions.count)")
    }
}

struct Mootshot_Previews: PreviewProvider {
    static var previews: some View {
        Mootshot()
    }
}
