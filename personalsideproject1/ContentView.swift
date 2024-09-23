//
//  ContentView.swift
//  personalsideproject1
//
//  Created by PM Student on 9/11/24.
//

import SwiftUI
import AVKit

struct ContentView: View {
    
    @State private var boats = 0
    @State private var multiplier = 1
    @State private var autoclicker = false
    @State private var autoclickerShow = true
    @State private var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        VStack {
            Text("Boats: \(boats)")
                .font(.title)
                .padding(.bottom, 30)
            
            Button(action: {
                boats += multiplier
            }) {
                Image("boats")
                    .frame(width: 100, height: 100)
            }
            .padding(50)
            
            // put button under a hstack here
            HStack {
                Button(action: {
                    if boats > 99 {
                        multiplier += 1
                        boats -= 100
                    }
                }) {
                    Text("x\(multiplier) Multiplier\n(It costs 100 boats)")
                }
                .frame(width: 175, height: 60)
                .background(Color("multiplierButton"))
                .cornerRadius(40)
                if autoclickerShow == true {
                    Button(action: {
                        if boats > 499 {
                            autoclicker = true
                            boats -= 500
                            autoclickerShow = false
                            
                        }
                    }) {
                        Text("Buy autoclicker for 500 boats")
                    }
                    .frame(width: 175, height: 60)
                    .background(Color("multiplierButton"))
                    .cornerRadius(40)
                }
            }
            
            HStack {
                if autoclickerShow == false {
                    Button(action: {
                        if autoclicker == true {
                            boats += multiplier
                        }
                    }) {
                        Text("Autoclick")
                    }
                    .frame(width: 175, height: 60)
                    .background(Color("multiplierButton"))
                    .cornerRadius(40)
                    .buttonRepeatBehavior(.enabled)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
