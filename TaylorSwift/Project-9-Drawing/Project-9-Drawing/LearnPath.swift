//
//  LearnPath.swift
//  Project-9-Drawing
//
//  Created by Yongye Tan on 4/17/23.
//

import SwiftUI

struct LearnPath: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x:200, y: 100))
            path.addLine(to: CGPoint(x:100, y: 300))
            path.addLine(to: CGPoint(x:300, y: 300))
            path.addLine(to: CGPoint(x:200, y: 100))
            
        }
        .stroke(.blue, lineWidth: 10)
    }
}

struct LearnPath_Previews: PreviewProvider {
    static var previews: some View {
        LearnPath()
    }
}
