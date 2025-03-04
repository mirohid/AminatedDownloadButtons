//
//  ContentView.swift
//  AminatedDownloadButtons
//
//  Created by MacMini6 on 04/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 80){
                 
                    Text("Animated Download Buttons")
                        .font(.title)
                        .bold()
                        .frame(width: 380, height: 60)
                        .background((Color.gray.opacity(0.7)))
                        .cornerRadius(10)
                        .padding()
                    
                    VStack(spacing: 20){
                        NavigationLink("Button 1") {
                            ButtonView1()
                        }.padding()
                            .foregroundStyle(.white)
                            .bold()
                            .font(.title)
                            .frame(width: 280, height: 60)
                            .background(Color.red)
                            .cornerRadius(20)
                        
                        NavigationLink("Button 2") {
                            ButtonView2()
                        }.padding()
                            .foregroundStyle(.white)
                            .bold()
                            .font(.title)
                            .frame(width: 280, height: 60)
                            .background(Color.blue)
                            .cornerRadius(20)
                        
                        NavigationLink("Button 3") {
                            ButtonView3()
                        }.padding()
                            .foregroundStyle(.white)
                            .bold()
                            .font(.title)
                            .frame(width: 280, height: 60)
                            .background(Color.green)
                            .cornerRadius(20)
                        NavigationLink("Button 4") {
                            ButtonView4()
                        }.padding()
                            .foregroundStyle(.white)
                            .bold()
                            .font(.title)
                            .frame(width: 280, height: 60)
                            .background(Color.orange)
                            .cornerRadius(20)
                        
                        NavigationLink("Button 5") {
                            ButtonView5()
                        }.padding()
                            .foregroundStyle(.white)
                            .bold()
                            .font(.title)
                            .frame(width: 280, height: 60)
                            .background(Color.black)
                            .cornerRadius(20)
                        
                        NavigationLink("Button 6") {
                            ButtonView6()
                        }.padding()
                            .foregroundStyle(.white)
                            .bold()
                            .font(.title)
                            .frame(width: 280, height: 60)
                            .background(Color.purple)
                            .cornerRadius(20)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
