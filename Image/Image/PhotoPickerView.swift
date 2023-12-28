//
//  PhotoPickerView.swift
//  Image
//
//  Created by Yongye Tan on 11/9/23.
//

import SwiftUI
import PhotosUI

struct PhotoPickerView: View {
    
    @StateObject private var viewModel = PhotoPickerViewModel()
        
    var body: some View {
        
        NavigationStack {
            VStack {
                ImageList(viewModel: viewModel)
                
                PhotosPicker(
                    selection: $viewModel.selection,
                    matching: .images
                ) {
                    Label("Select a photo", systemImage: "photo")
                }
                .ignoresSafeArea()
                .frame(height: 200)
                // .photosPickerDisabledCapabilities(.collectionNavigation) // remove album
                // .photosPickerStyle(.inline) // remove the sheet
                
            }
            .navigationTitle("Adding images")
        }
    
    }
}

/// A view that lists selected photos and their descriptions.
struct ImageList: View {
    
    /// A view model for the list.
    /// view model of the photopicker
    @ObservedObject var viewModel: PhotoPickerViewModel
    
    var body: some View {
        VStack {
            if let attachment = viewModel.imageSelection {
                
                ImageDisplayView(imageDisplay: attachment)
            } else {
                Spacer()
                Image(systemName: "photo")
                    .font(.system(size: 150))
                    .opacity(0.2)
                Spacer()
            }
        }
    }
}

struct ImageDisplayView: View {
    
    // pass one of the object from the view model
    @ObservedObject var imageDisplay: PhotoPickerViewModel.ImageSelection
    
    var body: some View {
        HStack {
            switch imageDisplay.imageStatus {
            case .finished(let image):
                image.resizable().scaledToFit().frame(minWidth: 300, maxWidth: .infinity)
            case .failed:
                Image("apple.logo")
            default:
                ProgressView()
            }
        }
        
        .task {
            print("trying to load the image should work from here")
            await imageDisplay.loadImage()
        }
    }
    
}
