//
//  TableTesting.swift
//  MacOSWorkExperiment
//
//  Created by Yongye Tan on 11/27/23.
//

import SwiftUI

struct TableTesting: View {
    let family: [Person] = [.johnny, .tim]
    
    @State private var bookmarksExpanded = false
    @Binding var selectedPerson: Set<Person.ID>
    @SceneStorage("custom") var columnCustomization: TableColumnCustomization<Person>
    
    var body: some View {
        Table(of: Person.self, 
              selection: $selectedPerson,
              columnCustomization: $columnCustomization) {
            TableColumn("Name", value: \.name)
                .customizationID("name")
            TableColumn("City", value: \.city)
                .customizationID("city")
            TableColumn("Birthdate") { person in
                Text(person.birthDate.formatted(date: .numeric, time: .omitted))
            }
            .customizationID("Date")
        } rows: {
            ForEach(family) { member in
                if member.children.isEmpty {
                    TableRow(member)
                } else {
                    DisclosureTableRow(member, isExpanded: $bookmarksExpanded) {
                        ForEach(member.children)
                    }
                }
            }
        }
    }
}

struct Person: Identifiable {
    let id = UUID()
    let name: String
    var city: String
    let birthDate: Date
    var children = [Person]()
    
    // some example websites
    static let betsy = Person(name: "Betsy Appleseed", city: "San Jose", birthDate: ISO8601DateFormatter().date(from: "1977-01-30T11:28:00+00:00")!)
    static let kate = Person(name: "Kate Appleseed", city: "Los Altos", birthDate: ISO8601DateFormatter().date(from: "1977-02-25T04:15:00+00:00")!)
    static let johnny = Person(name: "Johnny Appleseed", city: "Santa Clara", birthDate: ISO8601DateFormatter().date(from: "1952-06-03T12:45:00+00:00")!, children: [betsy, kate])
    static let tim = Person(name: "Tim Appleseed", city: "Mountain View", birthDate: ISO8601DateFormatter().date(from: "1960-11-01T09:41:00+00:00")!)
}

