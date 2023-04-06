//
//  Mootshot.swift
//  Moonshot
//
//  Created by Yongye Tan on 4/5/23.
//

import SwiftUI

struct Mootshot: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    var body: some View {
        Text("\(astronauts.count)")
    }
}

struct Mootshot_Previews: PreviewProvider {
    static var previews: some View {
        Mootshot()
    }
}
