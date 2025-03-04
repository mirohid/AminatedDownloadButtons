
//  ButtonView1.swift
//  AminatedDownloadButtons
//
//  Created by MacMini6 on 04/03/25.
//

import SwiftUI

struct ButtonView2: View {
    @State private var isDownloading2 = false
    @State private var downloadProgress2: CGFloat = 0.0
    @State private var animateTitle = false
    @State private var checkmarkBounce = false

    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            ZStack {
                // Animated Background
                LinearGradient(
                    gradient: Gradient(colors: [.clear, .blue]),
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
                            isDownloading2.toggle()
                            if isDownloading2 {
                                downloadProgress2 = 0.0
                            }
                        }) {
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray.opacity(0.2))
                                    .frame(width: 200, height: 50)
                                
                                if isDownloading2 {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.blue)
                                        .frame(width: 200 * downloadProgress2, height: 50)
                                        .animation(.linear, value: downloadProgress2)
                                }
                                
                                HStack {
                                    Spacer()
                                    if downloadProgress2 >= 1.0 {
                                        Text("Downloaded")
                                            .foregroundColor(.white)
                                            .bold()
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.white)
                                    } else {
                                        Text(isDownloading2 ? "Downloading..." : "Download")
                                            .foregroundColor(isDownloading2 ? .white : .blue)
                                            .bold()
                                        Image(systemName: isDownloading2 ? "stop.fill" : "arrow.down")
                                            .foregroundColor(isDownloading2 ? .white : .blue)
                                    }
                                    Spacer()
                                }
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .onReceive(timer) { _ in
                    if isDownloading2 && downloadProgress2 < 1.0 {
                        downloadProgress2 += 0.03
                        if downloadProgress2 >= 1.0 {
                            downloadProgress2 = 1.0
                            isDownloading2 = false
                        }
                    }
                }
            }
        }
    }
    
}
#Preview {
    ButtonView2()
}
