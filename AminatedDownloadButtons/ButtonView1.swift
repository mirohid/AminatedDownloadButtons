//
//  ButtonView1.swift
//  AminatedDownloadButtons
//
//  Created by MacMini6 on 04/03/25.
//

import SwiftUI

struct ButtonView1: View {
    @State private var isDownloading1 = false
    @State private var downloadProgress1: CGFloat = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Animated Download Buttons")
                    .font(.title2)
                    .bold()
                //.padding(.top)
                    .frame(width: 380, height: 60)
                    .background((Color.gray.opacity(0.7)))
                    .cornerRadius(10)
                    .padding()
           
                Button(action: {
                    isDownloading1.toggle()
                    if isDownloading1 {
                        downloadProgress1 = 0.0
                    }
                }) {
                    ZStack {
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 4)
                            .frame(width: 60, height: 60)
                        
                        if isDownloading1 {
                            Circle()
                                .trim(from: 0, to: downloadProgress1)
                                .stroke(Color.blue, lineWidth: 4)
                                .frame(width: 60, height: 60)
                                .rotationEffect(.degrees(-90))
                                .animation(.linear, value: downloadProgress1)
                        }
                        
                        if downloadProgress1 >= 1.0 {
                            Image(systemName: "checkmark")
                                .font(.title)
                                .foregroundColor(.green)
                                .transition(.opacity)
                        } else {
                            Image(systemName: isDownloading1 ? "stop.fill" : "arrow.down")
                                .font(.title2)
                                .foregroundColor(isDownloading1 ? .red : .blue)
                        }
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .frame(height: 80)
            }
        }
        .onReceive(timer) { _ in
            if isDownloading1 && downloadProgress1 < 1.0 {
                downloadProgress1 += 0.02
                if downloadProgress1 >= 1.0 {
                    downloadProgress1 = 1.0
                    isDownloading1 = false
                }
            }
        }
    }
}
#Preview {
    ButtonView1()
}
