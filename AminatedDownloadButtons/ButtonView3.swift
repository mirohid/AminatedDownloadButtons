//
//  ButtonView1.swift
//  AminatedDownloadButtons
//
//  Created by MacMini6 on 04/03/25.
//

import SwiftUI

struct ButtonView3: View {
    
    @State private var isDownloading3 = false
    @State private var downloadProgress3: CGFloat = 0.0
    @State private var animateTitle = false
    @State private var checkmarkBounce = false
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            // Animated Background
            LinearGradient(
                gradient: Gradient(colors: [.clear, .green]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
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
                        isDownloading3.toggle()
                        if isDownloading3 {
                            downloadProgress3 = 0.0
                        }
                    }) {
                        ZStack {
                            Circle()
                                .fill(downloadProgress3 >= 1.0 ? Color.green : (isDownloading3 ? Color.blue : Color.gray.opacity(0.3)))
                                .frame(width: 70, height: 70)
                                .scaleEffect(isDownloading3 ? 1.1 : 1.0)
                                .animation(isDownloading3 ? Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true) : .default, value: isDownloading3)
                            
                            VStack {
                                if downloadProgress3 >= 1.0 {
                                    Image(systemName: "checkmark")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                } else {
                                    Image(systemName: isDownloading3 ? "arrow.down.circle.fill" : "arrow.down")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                    
                                    if isDownloading3 {
                                        Text("\(Int(downloadProgress3 * 100))%")
                                            .font(.caption)
                                            .foregroundColor(.white)
                                            .bold()
                                    }
                                }
                            }
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(height: 80)
                }
            }
            .onReceive(timer) { _ in
                if isDownloading3 && downloadProgress3 < 1.0 {
                    downloadProgress3 += 0.01
                    if downloadProgress3 >= 1.0 {
                        downloadProgress3 = 1.0
                        isDownloading3 = false
                    }
                }
            }
        }
    }
}

#Preview {
    ButtonView3()
}
