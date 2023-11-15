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
    let emojis: Array<String> = ["🧑🏻‍💻", "🤓", "😂", "🇲🇽", "🍔", "🍪"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            cards
            cardCountAdjusters
        }.padding()
        
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardAdder
            Spacer()
            cardRemover
        }
    }
    
    var cards: some View {
        HStack {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
    }
    
    var cardAdder: some View {
        Button {
            if cardCount < emojis.count {
                cardCount += 1
            }
        } label: {
            Image(systemName: "person.crop.rectangle.badge.plus")
                .font(.largeTitle)
        }
    }
    
    var cardRemover: some View {
        Button {
            if cardCount > 1 {
                cardCount -= 1
            }
        } label: {
            Image(systemName: "rectangle.stack.badge.minus.fill")
                .font(.largeTitle)
        }
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
