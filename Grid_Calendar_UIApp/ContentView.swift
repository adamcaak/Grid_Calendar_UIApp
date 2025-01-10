//
//  ContentView.swift
//  Grid_Calendar_UIApp
//
//  Created by Łukasz Adamczak on 10/01/2025.
//

import SwiftUI

struct ContentView: View {
    
    let layout = [
        GridItem(.fixed(40))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(year[0].days) { day in
                    Capsule()
                        .overlay(Text("\(day.value)").foregroundColor(.white))
                        .foregroundColor(.blue)
                        .frame(height: 40)
                }
            }
        }
    }
    
    struct Day: Identifiable {
        let id = UUID()
        let value: Int
    }
    
    struct Month {
        let name: String
        let valueOfDay: Int
        var days: [Day]
        
        init(name: String, valueOfDay: Int, days: [Day]) {
            self.name = name
            self.valueOfDay = valueOfDay
            self.days = days
            
            for n in 1...valueOfDay {
                self.days.append(Day(value: n))
            }
        }
    }
    
    let year = [
        Month(name: "January", valueOfDay: 31, days: []),
        Month(name: "February", valueOfDay: 28, days: []),
        Month(name: "March", valueOfDay: 31, days: []),
        Month(name: "April", valueOfDay: 30, days: []),
        Month(name: "May", valueOfDay: 31, days: []),
        Month(name: "June", valueOfDay: 30, days: []),
        Month(name: "July", valueOfDay: 31, days: []),
        Month(name: "August", valueOfDay: 31, days: []),
        Month(name: "September", valueOfDay: 30, days: []),
        Month(name: "October", valueOfDay: 31, days: []),
        Month(name: "November", valueOfDay: 30, days: []),
        Month(name: "December", valueOfDay: 31, days: [])
    ]
}

#Preview {
    ContentView()
}
