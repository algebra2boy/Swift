//
//  GetDocumentDirectory.swift
//  BucketList
//
//  Created by Yongye Tan on 7/16/23.
//

import SwiftUI

struct GetDocumentDirectory: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                let str = "Testing testing"
                
                let url = getDocumentsDirectory().appendingPathComponent("message.txt")
                print(url)
                
                do {
                    try str.write(to: url, atomically: true, encoding: .utf8)
                    let input = try String(contentsOf: url)
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
            }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(paths)
        return paths[0]
    }
}
