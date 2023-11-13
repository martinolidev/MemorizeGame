//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Martin Martinez on 13/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CardView()
    }
}


struct CardView: View {
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 25)
                .strokeBorder(Color.indigo,lineWidth: 4)
                .overlay(
                Text("🤓")
                    .font(.largeTitle)
                )
            RoundedRectangle(cornerRadius: 25)
                .strokeBorder(Color.indigo,lineWidth: 4)
                .overlay(
                Text("🤓")
                    .font(.largeTitle)
                )
            RoundedRectangle(cornerRadius: 25)
                .strokeBorder(Color.indigo,lineWidth: 4)
                .overlay(
                Text("🤓")
                    .font(.largeTitle)
                )
            RoundedRectangle(cornerRadius: 25)
                .strokeBorder(Color.indigo,lineWidth: 4)
                .overlay(
                Text("🤓")
                    .font(.largeTitle)
                )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
