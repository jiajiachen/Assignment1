//
//  ContentView.swift
//  Assignment1
//
//  Created by Jia Chen on 2024/10/14.
//

import SwiftUI

struct ContentView: View {
    let travelEmojis = ["🚗", "🚕","✈️","🛺", "🎡", "🚲","🚆","🛩️"]
    let naturalEmojis = ["🐶","🐱","🐸","🐼", "🐵", "🦆", "🦄", "🐝", "🐢", "🦉"]
    let fruitEmojis = ["🍏","🍎","🍐","🍋","🍆","🌽","🍌", "🥝", "🍑"]
   
    @State var emojis: Array<String> = []
    @State var emojiType: String = ""
   
    @State var themeColor: Color?
    
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                if (emojiType != "") {
                    cards
                }
                
            }
            Spacer()
            cardChooser
            
        }
        
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
            ForEach(0..<emojis.count , id: \.self) { index in
                CardView(content: emojis[index], isFaceUp: false, fillColor: themeColor)
                    .aspectRatio(2/3, contentMode: .fit)
            
            }
        }
    }
    
    var cardChooser: some View {
        HStack(alignment: .lastTextBaseline) {
            btnChooser(choose: "Map", symbol: emojiType == "Map" ? "map.fill" : "map")
            Spacer()
            btnChooser(choose: "Leaf", symbol: emojiType == "Leaf" ? "leaf.fill" : "leaf")
            Spacer()
            btnChooser(choose: "Carrot", symbol: emojiType == "Carrot" ? "carrot.fill" : "carrot")
               
        }
        .frame(width: 260)
        .imageScale(.large)
        .font(.title2)
    }
    

    
    func btnChooser(choose type: String, symbol: String) -> some View {
        Button(action: {
            emojis = []
            if type == "Map" {
                emojiType = "Map"
                let emojiCount = Int.random(in: 4...travelEmojis.count)
                let travelEmojisShuffled = travelEmojis.shuffled()
                var emojiArray: Array<String> = []
                for index in 0..<emojiCount {
                    emojiArray.append(travelEmojisShuffled[index])
                    emojiArray.append(travelEmojisShuffled[index])
                }
                emojis = emojiArray.shuffled()
                themeColor = .purple
            } else if type == "Leaf" {
                emojiType = "Leaf"
                let emojiCount = Int.random(in: 4...naturalEmojis.count)
                let naturalEmojisShuffled = naturalEmojis.shuffled()
                var emojiArray: Array<String> = []
                for index in 0..<emojiCount {
                    emojiArray.append(naturalEmojisShuffled[index])
                    emojiArray.append(naturalEmojisShuffled[index])
                }
                emojis = emojiArray.shuffled()
                themeColor = .green
            } else if type == "Carrot" {
                emojiType = "Carrot"
                let emojiCount = Int.random(in: 4...fruitEmojis.count)
                let fruitEmojisShuffled = fruitEmojis.shuffled()
                var emojiArray: Array<String> = []
                for index in 0..<emojiCount {
                    emojiArray.append(fruitEmojisShuffled[index])
                    emojiArray.append(fruitEmojisShuffled[index])
                }
                emojis = emojiArray.shuffled()
                themeColor = .orange
            }
            print(1)
            
        }, label: {
            VStack {
                Image(systemName: symbol)
                Text(type)
            }
            
        })
    }
    
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = false
    let fillColor: Color?
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundStyle(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.foregroundStyle(fillColor!)
        .onTapGesture {
           isFaceUp.toggle()
        }
   
    }
}

#Preview {
    ContentView()
}
