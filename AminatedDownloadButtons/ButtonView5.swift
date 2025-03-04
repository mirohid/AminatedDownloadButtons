//
//  ButtonView1.swift
//  AminatedDownloadButtons
//
//  Created by MacMini6 on 04/03/25.
//

import SwiftUI

struct ButtonView5: View {
    @State private var isDownloading5 = false
    @State private var downloadProgress5: CGFloat = 0.0
    @State private var animateTitle = false
    @State private var checkmarkBounce = false
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            // Animated Background
            LinearGradient(
                gradient: Gradient(colors: [.clear, .black]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ).ignoresSafeArea()
            ScrollView {
                VStack(spacing: 30) {
                    Text("🚀 Animated Download")
                        .font(.title)
                        .bold()
                        .foregroundColor(.black)
                        .shadow(radius: 10)
                        .scaleEffect(animateTitle ? 1 : 0.5)
                        .opacity(animateTitle ? 1 : 0)
                        .animation(.easeInOut(duration: 1), value: animateTitle)
                        .onAppear {
                            animateTitle = true
                        }
                    
                    Button(action: {
                        isDownloading5.toggle()
                        if isDownloading5 {
                            downloadProgress5 = 0.0
                        }
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.black.opacity(0.8))
                                .frame(width: 65, height: 65)
                            
                            if downloadProgress5 >= 1.0 {
                                Image(systemName: "checkmark")
                                    .font(.title)
                                    .foregroundColor(.green)
                                    .transition(.scale)
                            } else if isDownloading5 {
                                VStack {
                                    Image(systemName: "arrow.down")
                                        .font(.body)
                                        .foregroundColor(.white)
                                        .offset(y: isDownloading5 ? 5 : -5)
                                        .animation(Animation.easeInOut(duration: 0.6).repeatForever(autoreverses: true), value: isDownloading5)
                                    
                                    Text("\(Int(downloadProgress5 * 100))%")
                                        .font(.caption2)
                                        .foregroundColor(.white)
                                }
                            } else {
                                Image(systemName: "arrow.down.circle")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(height: 80)
                }
            }
            .onReceive(timer) { _ in
                if isDownloading5 && downloadProgress5 < 1.0 {
                    downloadProgress5 += 0.015
                    if downloadProgress5 >= 1.0 {
                        downloadProgress5 = 1.0
                        isDownloading5 = false
                    }
                }
            }
        }
    }
}
    #Preview {
        ButtonView5()
    }
