//
//  EmojiMemomyGameView.swift
//  Memorize
//
//  Created by Sósthenes Oliveira Lima on 20/08/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
   @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(viewModel.cards) { card in
            CardView (card: card).onTapGesture {
                viewModel.choose(card: card)
            }
            .padding(3)
            
        }
    
        
        .padding()
        .foregroundColor(Color.purple)
        Button("Reiniciar") {
        }
        .padding()
        .background(Color.blue)
        .foregroundColor(Color.white)
        .cornerRadius(10)
        .padding(.all, 10)
        
        
    }
}

struct RestartButtonView: View {
    @State private var restartButtonTapped = false

    var body: some View {
        VStack {
            Text("Conteúdo da Tela")

            Button("Reiniciar Tela") {
                // Ação quando o botão é pressionado
                restartButtonTapped.toggle()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .padding(.top, 20)
        }
        .id(restartButtonTapped) // A variável de estado como identificador
    }
}

struct RestartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RestartButtonView()
    }
}
struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View{
        GeometryReader { geometry in
            self.body(for: geometry.size)
          }
        }
        
        func body(for size: CGSize) -> some View {
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: corneRadius).fill(Color.gray)
                    RoundedRectangle(cornerRadius: corneRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                } else {
                    if !card.isMatched {
                        RoundedRectangle(cornerRadius: corneRadius).fill()
                    }
                }
            }
             .font(Font.system(size: fontSize(for: size)))
         }
            
    
    // Mark: - Drawing Constants
    
    let corneRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            VStack{
                EmojiMemoryGameView(viewModel: EmojiMemoryGame())
                
            }
            
        }
    }
    

