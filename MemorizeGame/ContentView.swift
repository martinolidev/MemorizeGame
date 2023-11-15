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
            ScrollView {
             cards
            }
            Spacer()
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
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button {
            cardCount += offset
        } label: {
            Image(systemName: symbol)
                .font(.largeTitle)
        }
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count - 1)
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
    }

    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
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

                Group {
                    card.fill(.white)
                    card.stroke(Color.indigo,lineWidth: 4)
                    Text(content).font(.largeTitle)
                }.opacity(isFaceUp ? 1 : 0)
                card.fill(.indigo).opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
