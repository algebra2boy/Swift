//
//  StateWithEnumViews.swift
//  BucketList
//
//  Created by Yongye Tan on 7/16/23.
//

import SwiftUI

enum LoadingState {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("loading")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("success")
    }
}

struct FailedView: View {
    var body: some View {
        Text("failed")
    }
}

struct StateWithEnumViews: View {
    var loadingState: LoadingState = .loading
    var body: some View {
        switch loadingState {
        case .loading:
            LoadingView()
        case .failed:
            FailedView()
        case .success:
            SuccessView()
        }
    }
}
