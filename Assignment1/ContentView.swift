//
//  ContentView.swift
//  Assignment1
//
//  Created by Jia Chen on 2024/10/14.
//

import SwiftUI

struct ContentView: View {
    let mapEmojis = ["🎃","🎃","🎃", "🎃", "🎃","🎃","🎃","🎃","🎃","🎃","🎃"]
    let naturalEmojis = ["😈", "😈","😈","😈", "😈", "😈","😈","😈","😈","😈","😈","😈"]
    let messageEmojis = ["🧙‍♀️", "🧙‍♀️","🧙‍♀️","🧙‍♀️", "🧙‍♀️", "🧙‍♀️","🧙‍♀️","🧙‍♀️","🧙‍♀️","🧙‍♀️","🧙‍♀️","🧙‍♀️"]
    @State var emojiType: String = "Map"
    var body: some View {
        
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                cards
            }
            
            Spacer()
            cardChooser
            
        }
        
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
            if emojiType == "Map" {
                getCards(by: mapEmojis)
            } else if emojiType == "Leaf" {
                getCards(by: naturalEmojis)
            } else if emojiType == "Message" {
                getCards(by: messageEmojis)
            }
            
        }
        .foregroundStyle(.orange)
    }
    
    var cardChooser: some View {
        HStack {
            btnChooser(choose: "Map", symbol: emojiType == "Map" ? "map.fill" : "map")
            Spacer()
            btnChooser(choose: "Leaf", symbol: emojiType == "Leaf" ? "leaf.fill" : "leaf")
            Spacer()
            btnChooser(choose: "Message", symbol: emojiType == "Message" ? "message.fill" : "message")
               
        }
        .imageScale(.large)
        .font(.title2)
    }
    
    func getCards(by emojis: Array<String>) ->  some View {
        ForEach(0..<8, id: \.self) { index in
            CardView(content: emojis[index], isFaceUp: true)
                .aspectRatio(2/3, contentMode: .fit)
            CardView(content: emojis[index], isFaceUp: true)
                .aspectRatio(2/3, contentMode: .fit)
        }
    }
    
    func btnChooser(choose type: String, symbol: String) -> some View {
        Button(action: {
            if type == "Map" {
                emojiType = "Map"
            } else if type == "Leaf" {
                emojiType = "Leaf"
            } else if type == "Message" {
                emojiType = "Message"
            }
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
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.foregroundStyle(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }.opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
   
    }
}

#Preview {
    ContentView()
}
