//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Martin Martinez on 13/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
        }.padding()
    }
}


struct CardView: View {
    
    var isFaceUp: Bool = false
    
    var body: some View {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 25)
                    .strokeBorder(Color.indigo,lineWidth: 4)
                    .overlay(
                    Text("🤓")
                        .font(.largeTitle)
                    )
            } else {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.indigo)
            }
    }
}

#Preview {
    ContentView()
}
