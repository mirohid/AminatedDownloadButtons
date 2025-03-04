//
//  ButtonView1.swift
//  AminatedDownloadButtons
//
//  Created by MacMini6 on 04/03/25.
//

//import SwiftUI
//
//struct ButtonView1: View {
//    @State private var isDownloading1 = false
//    @State private var downloadProgress1: CGFloat = 0.0
//    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
//    
//    var body: some View {
//        ScrollView {
//            VStack(spacing: 30) {
//                Text("Animated Download Buttons")
//                    .font(.title2)
//                    .bold()
//                //.padding(.top)
//                    .frame(width: 380, height: 60)
//                    .background((Color.gray.opacity(0.7)))
//                    .cornerRadius(10)
//                    .padding()
//           
//                Button(action: {
//                    isDownloading1.toggle()
//                    if isDownloading1 {
//                        downloadProgress1 = 0.0
//                    }
//                }) {
//                    ZStack {
//                        Circle()
//                            .stroke(Color.gray.opacity(0.3), lineWidth: 4)
//                            .frame(width: 60, height: 60)
//                        
//                        if isDownloading1 {
//                            Circle()
//                                .trim(from: 0, to: downloadProgress1)
//                                .stroke(Color.blue, lineWidth: 4)
//                                .frame(width: 60, height: 60)
//                                .rotationEffect(.degrees(-90))
//                                .animation(.linear, value: downloadProgress1)
//                        }
//                        
//                        if downloadProgress1 >= 1.0 {
//                            Image(systemName: "checkmark")
//                                .font(.title)
//                                .foregroundColor(.green)
//                                .transition(.opacity)
//                        } else {
//                            Image(systemName: isDownloading1 ? "stop.fill" : "arrow.down")
//                                .font(.title2)
//                                .foregroundColor(isDownloading1 ? .red : .blue)
//                        }
//                    }
//                }
//                .buttonStyle(PlainButtonStyle())
//                .frame(height: 80)
//            }
//        }
//        .onReceive(timer) { _ in
//            if isDownloading1 && downloadProgress1 < 1.0 {
//                downloadProgress1 += 0.02
//                if downloadProgress1 >= 1.0 {
//                    downloadProgress1 = 1.0
//                    isDownloading1 = false
//                }
//            }
//        }
//    }
//}
//#Preview {
//    ButtonView1()
//}


import SwiftUI

struct ButtonView1: View {
    @State private var isDownloading1 = false
    @State private var downloadProgress1: CGFloat = 0.0
    @State private var animateTitle = false
    @State private var checkmarkBounce = false

    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            // Animated Background
            LinearGradient(
                gradient: Gradient(colors: [.clear, .red]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 30) {
                    // Animated Title
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

                    // Animated Download Button
                    Button(action: {
                        isDownloading1.toggle()
                        if isDownloading1 {
                            downloadProgress1 = 0.0
                        }
                    }) {
                        ZStack {
                            Circle()
                                .stroke(Color.gray.opacity(0.3), lineWidth: 4)
                                .frame(width: 70, height: 70)
                                .scaleEffect(isDownloading1 ? 1.1 : 1.0)
                                .animation(.easeInOut(duration: 0.3).repeatForever(autoreverses: true), value: isDownloading1)

                            if isDownloading1 {
                                Circle()
                                    .trim(from: 0, to: downloadProgress1)
                                    .stroke(Color.blue, lineWidth: 4)
                                    .frame(width: 70, height: 70)
                                    .rotationEffect(.degrees(-90))
                                    .animation(.linear(duration: 0.1), value: downloadProgress1)
                            }

                            if downloadProgress1 >= 1.0 {
                                Image(systemName: "checkmark")
                                    .font(.title)
                                    .foregroundColor(.green)
                                    .scaleEffect(checkmarkBounce ? 1.2 : 1.0)
                                    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.3), value: checkmarkBounce)
                                    .onAppear {
                                        checkmarkBounce = true
                                    }
                            } else {
                                Image(systemName: isDownloading1 ? "stop.fill" : "arrow.down")
                                    .font(.title2)
                                    .foregroundColor(isDownloading1 ? .red : .blue)
                                    .scaleEffect(isDownloading1 ? 1.2 : 1.0)
                                    .animation(.easeInOut(duration: 0.2), value: isDownloading1)
                            }
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(height: 80)
                }
                .padding(.top, 50)
            }
        }
        .onReceive(timer) { _ in
            if isDownloading1 && downloadProgress1 < 1.0 {
                downloadProgress1 += 0.02
                if downloadProgress1 >= 1.0 {
                    downloadProgress1 = 1.0
                    isDownloading1 = false
                    checkmarkBounce = false
                }
            }
        }
    }
}

#Preview {
    ButtonView1()
}
