//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Martin Martinez on 13/11/23.
//

import SwiftUI

struct ContentView: View {
    //Specify the array type
    //You can also specify the type like this [String] - [Int]
    let emojis: Array<String> = ["🧑🏻‍💻", "🤓", "😂", "🇲🇽"]
    
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }.padding()
    }
}


struct CardView: View {
    
    //@State creates reactive properties, updating the view when
    //is changed, that's how we have dynamic SwiftUI
    @State var isFaceUp: Bool = false
    
    let content: String
    
    var body: some View {
        ZStack {
            //Use let if is a constant
            let card: RoundedRectangle = RoundedRectangle(cornerRadius: 25)

                if isFaceUp {
                    card.fill(.white)
                    card.stroke(Color.indigo,lineWidth: 4)
                    Text(content).font(.largeTitle)
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
