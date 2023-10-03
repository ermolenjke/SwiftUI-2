//
//  ContentView.swift
//  SwiftUI#2
//
//  Created by Даниил Ермоленко on 03.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var frameWidth: CGFloat = 300
    
    var body: some View {
        FrameAdjustingContainer(frameWidth: $frameWidth) {
            Group {
                Text("Марафон ")
                    .foregroundColor(Color.cyan)
                    .font(.system(size: 16))  +
                Text("по SwiftUI ")
                    .foregroundColor(Color.purple)
                    .fontWeight(.heavy)       +
                Text("\n\"Отцовский пинок\"")
                    .foregroundColor(Color.indigo)
                    .fontWeight(.bold)
                    .font(.system(size: 26))
            }
        }
    }
}

struct FrameAdjustingContainer<Content: View>: View {
    @Binding var frameWidth: CGFloat
    let content: () -> Content
    
    var body: some View  {
        ZStack {
            VStack {
                content()
                    .frame(width: frameWidth, height: 175)
                    .border(Color.red, width: 1)
                
                Slider(value: $frameWidth, in: 100...300)
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}
