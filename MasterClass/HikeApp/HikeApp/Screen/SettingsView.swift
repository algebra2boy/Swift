//
//  SettingsView.swift
//  HikeApp
//
//  Created by Yongye Tan on 7/10/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        List {
            // MARK: - SECTION: HEADER
            // the spacer is used to center the header
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    // negative spacing means make them closer
                    VStack (spacing: -10){
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        
                        Text("Editor's Choice")
                            .font(.title3)
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(colors: [.customGreenLight, .customGreenMedium, .customGreenDark],
                                   startPoint: .top,
                                   endPoint: .bottom)
                    
                )
                .padding(.top, 8)
                
                VStack (spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in teh app")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk and fight for my life")
                        .fontWeight(.heavy)
                        .foregroundStyle(Color.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
            }
            .listRowSeparator(.hidden) // hide the divider
        
            // MARK: - SECTION: ICONS
            
            // MARK: - SECTION: ABOUT
            Section {
                // a container for attaching a label to a value-bearing view
                // Label on left, and value on right
//                LabeledContent("Application", value: "Hike")
                
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .blue)
                
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .pink)
                
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                
                CustomListRowView(rowLabel: "Developer", rowIcon: "laptopcomputer", rowContent: "Yongye", rowTintColor: .green)
                
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .mint)
                
                CustomListRowView(rowLabel: "Website", rowIcon: "network", rowTintColor: .purple, rowLabelLink: "github.com/algebra2boy", rowLinkDestination: "https://github.com/algebra2boy")
                
            } header: {
                Text("ABOUT THE APP")
            } footer: {
                // do option G to get the symbol
                HStack {
                    Spacer()
                    Text("Copyright © All right reserved")
                    Spacer()
                }
                .padding(.vertical, 10)
            }
            
        }
    }
}

#Preview {
    SettingsView()
}
