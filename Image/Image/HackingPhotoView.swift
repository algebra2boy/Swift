//
//  HackingPhotoView.swift
//  Image
//
//  Created by Yongye Tan on 11/9/23.
//

import SwiftUI

import PhotosUI
import SwiftUI

struct HackingPhotoView: View {
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    
    @StateObject private var photoNetworkViewModel = PhotoNetworkViewModel()

    var body: some View {
        VStack {
            PhotosPicker("Select avatar", 
                         selection: $avatarItem,
                         matching: .images)

            if let avatarImage {
                avatarImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)

            }
            
            if let avatarImage {
                Button {
                    uploadImage()
                } label: {
                    Text("Submit to node.js server")
                }
            }
        }
        .onChange(of: avatarItem) {
            Task {
                if let data = try? await avatarItem?.loadTransferable(type: Data.self) {
                    if let uiImage = UIImage(data: data) {
                        avatarImage = Image(uiImage: uiImage)
                        return
                    }
                }

                print("Failed")
            }
        }
    }
    
    func uploadImage() {
        
        
        guard let url = URL(string: "http://localhost:3000/api") else {
            return
        }
        
        // specify a url request to send to Node.js server
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        // create boundary
        let boundary = photoNetworkViewModel.generateBoundary()
        
        // set content type
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        
    }
}

#Preview {
    HackingPhotoView()
}
