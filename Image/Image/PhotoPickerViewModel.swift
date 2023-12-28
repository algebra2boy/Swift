//
//  PhotoPickerViewModel.swift
//  Image
//
//  Created by Yongye Tan on 11/9/23.
//

import Foundation
import SwiftUI
import PhotosUI

// A view model that represents the photo view picker model
@MainActor final class PhotoPickerViewModel: ObservableObject {
    
    @MainActor final class ImageSelection: ObservableObject, Identifiable {
        
        enum Status {
            
            case loading
            
            case finished(Image)
            
            case failed(Error)
            
            var isFailed: Bool {
                return switch self {
                case .failed: true
                default: false
                }
            }
        }
        
        
        enum LoadingError: Error {
            case contentTypeNotSupported
        }
        
        private let pickerItem: PhotosPickerItem
        
        @Published var imageStatus: Status?
        
        nonisolated var id: String {
            pickerItem.identifier
        }
        
        init(_ picture: PhotosPickerItem) {
            self.pickerItem = picture
        }
        
        func loadImage() async {
            guard imageStatus == nil || imageStatus?.isFailed == true else {
                print("I am failed omG")
                return
            }
            
            print("before loading here")
            imageStatus = .loading
            print("after loading here")
            do {
                // conver the image to data type
                if let data = try await pickerItem.loadTransferable(type: Data.self),
                   // conver the data to UI image
                   let uiImage = UIImage(data: data) {
                    // convert the UI image to SwiftUI Image then
                    // pass the SwiftUI Image to the status associcated type
                    imageStatus = .finished(Image(uiImage: uiImage))
                    print("finished!!!")
                } else {
                    throw LoadingError.contentTypeNotSupported
                }
            } catch {
                imageStatus = .failed(error)
            }
            
        }
        
    }
    
    @Published var selection: PhotosPickerItem? {
        didSet {
            
            if let selection {
                print("printing from here")
                imageSelection = ImageSelection(selection)
            }
        }
    }
    
    @Published var imageSelection: ImageSelection? = nil {
        didSet {
            print("image selection has been changed")
        }
    }
    
    init() { }
    
}

private extension PhotosPickerItem {
    var identifier: String {
        guard let identifier = self.itemIdentifier else {
            fatalError("The photos picker lacks a photo library.")
        }
        return identifier
    }
}
