//
//  ButtonView1.swift
//  AminatedDownloadButtons
//
//  Created by MacMini6 on 04/03/25.
//

import SwiftUI

struct ButtonView6: View {
    @State private var isDownloading6 = false
    @State private var downloadProgress6: CGFloat = 0.0
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
                    isDownloading6.toggle()
                    if isDownloading6 {
                        downloadProgress6 = 0.0
                    }
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: isDownloading6 ? 25 : 10)
                            .fill(downloadProgress6 >= 1.0 ? Color.green : (isDownloading6 ? Color.orange : Color.purple))
                            .frame(width: isDownloading6 ? (downloadProgress6 >= 1.0 ? 180 : 50) : 180, height: 50)
                            .animation(.spring(), value: isDownloading6)
                            .animation(.spring(), value: downloadProgress6)
                        
                        if downloadProgress6 >= 1.0 {
                            HStack {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.white)
                                Text("Done")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            }
                            .transition(.scale)
                        } else if isDownloading6 {
                            if downloadProgress6 > 0 {
                                Text("\(Int(downloadProgress6 * 100))")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            } else {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                    .scaleEffect(0.8)
                            }
                        } else {
                            HStack {
                                Image(systemName: "square.and.arrow.down")
                                    .foregroundColor(.white)
                                Text("Download File")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            }
                        }
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.bottom, 50)
            }
        }
        .onReceive(timer) { _ in
            if isDownloading6 && downloadProgress6 < 1.0 {
                downloadProgress6 += 0.02
                if downloadProgress6 >= 1.0 {
                    downloadProgress6 = 1.0
                    isDownloading6 = false
                }
            }
        }
    }
}

#Preview {
    ButtonView6()
}
