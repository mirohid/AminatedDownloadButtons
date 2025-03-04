//
//  ButtonView1.swift
//  AminatedDownloadButtons
//
//  Created by MacMini6 on 04/03/25.
//

import SwiftUI

struct ButtonView4: View {
    @State private var isDownloading4 = false
    @State private var downloadProgress4: CGFloat = 0.0
    @State private var animateTitle = false
    @State private var checkmarkBounce = false
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            // Animated Background
            LinearGradient(
                gradient: Gradient(colors: [.yellow, .clear]),
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
                        isDownloading4.toggle()
                        if isDownloading4 {
                            downloadProgress4 = 0.0
                        }
                    }) {
                        HStack {
                            Spacer()
                            if downloadProgress4 >= 1.0 {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.white)
                                Text("Complete")
                                    .foregroundColor(.white)
                                    .fontWeight(.medium)
                            } else if isDownloading4 {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                    .scaleEffect(0.8)
                                Text("Downloading \(Int(downloadProgress4 * 100))%")
                                    .foregroundColor(.white)
                                    .fontWeight(.medium)
                            } else {
                                Image(systemName: "arrow.down")
                                    .foregroundColor(.white)
                                Text("Download")
                                    .foregroundColor(.white)
                                    .fontWeight(.medium)
                            }
                            Spacer()
                        }
                        .padding(.vertical, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .fill(downloadProgress4 >= 1.0 ? Color.green : Color.blue)
                        )
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                    }
                    .frame(width: 200)
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .onReceive(timer) { _ in
                if isDownloading4 && downloadProgress4 < 1.0 {
                    downloadProgress4 += 0.025
                    if downloadProgress4 >= 1.0 {
                        downloadProgress4 = 1.0
                        isDownloading4 = false
                    }
                }
            }
        }
    }
}
#Preview {
    ButtonView4()
}
