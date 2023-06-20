//
//  DragDrop2.swift
//  WorkExperiment
//
//  Created by Yongye Tan on 5/9/23.
//

import SwiftUI

struct DragDrop2: View {
    var body: some View {
        Text("Drag me!")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .onDrag {
                        return NSItemProvider(object: "Hello World" as NSString)
                    }
    }
}

struct DragDrop2_Previews: PreviewProvider {
    static var previews: some View {
        DragDrop2()
    }
}
