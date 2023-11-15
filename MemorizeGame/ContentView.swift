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
            CardView()
            CardView()
        }.padding()
    }
}


struct CardView: View {
    
    //@State creates reactive properties, updating the view when
    //is changed, that's how we have dynamic SwiftUI
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            //Use let if is a constant
            let card: RoundedRectangle = RoundedRectangle(cornerRadius: 25)

                if isFaceUp {
                    card.fill(.white)
                    card.stroke(Color.indigo,lineWidth: 4)
                    Text("🤓").font(.largeTitle)
                } else {
                    card.fill(.indigo)
                }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
