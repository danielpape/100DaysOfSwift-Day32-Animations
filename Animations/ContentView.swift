//
//  ContentView.swift
//  Animations
//
//  Created by Daniel Pape on 19/04/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var dragAmount = CGSize.zero
    @State private var showing = true
    
    var body: some View {
        
        Button("Toggle"){
            withAnimation(Animation.linear.delay(2.0)){
                showing.toggle()
            }
        }
        
        if showing {
            LinearGradient(gradient: Gradient(colors: [.red,.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged {self.dragAmount = $0.translation}
                    .onEnded {_ in
                        withAnimation(.spring()) {
                            dragAmount = .zero
                        }
                        
                    }
            )
            .transition(.scale)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
