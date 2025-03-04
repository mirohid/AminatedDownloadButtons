//
//  AnimatedDownloadButtons.swift
//  AminatedDownloadButtons
//
//  Created by MacMini6 on 04/03/25.
//


import SwiftUI

struct AnimatedDownloadButtons: View {
    @State private var isDownloading1 = false
    @State private var downloadProgress1: CGFloat = 0.0
    
    @State private var isDownloading2 = false
    @State private var downloadProgress2: CGFloat = 0.0
    
    @State private var isDownloading3 = false
    @State private var downloadProgress3: CGFloat = 0.0
    
    @State private var isDownloading4 = false
    @State private var downloadProgress4: CGFloat = 0.0
    
    @State private var isDownloading5 = false
    @State private var downloadProgress5: CGFloat = 0.0
    
    @State private var isDownloading6 = false
    @State private var downloadProgress6: CGFloat = 0.0
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Animated Download Buttons")
                    .font(.title)
                    .padding(.top)
                
                // Button 1 - Circle Progress
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
                
                // Button 2 - Horizontal Progress
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
                
                // Button 3 - Pulse Animation
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
                
                // Button 4 - Material style
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
                
                // Button 5 - Animating Icon
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
                
                // Button 6 - Morphing Button
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
            .padding()
        }
        .onReceive(timer) { _ in
            if isDownloading1 && downloadProgress1 < 1.0 {
                downloadProgress1 += 0.02
                if downloadProgress1 >= 1.0 {
                    downloadProgress1 = 1.0
                    isDownloading1 = false
                }
            }
            
            if isDownloading2 && downloadProgress2 < 1.0 {
                downloadProgress2 += 0.03
                if downloadProgress2 >= 1.0 {
                    downloadProgress2 = 1.0
                    isDownloading2 = false
                }
            }
            
            if isDownloading3 && downloadProgress3 < 1.0 {
                downloadProgress3 += 0.01
                if downloadProgress3 >= 1.0 {
                    downloadProgress3 = 1.0
                    isDownloading3 = false
                }
            }
            
            if isDownloading4 && downloadProgress4 < 1.0 {
                downloadProgress4 += 0.025
                if downloadProgress4 >= 1.0 {
                    downloadProgress4 = 1.0
                    isDownloading4 = false
                }
            }
            
            if isDownloading5 && downloadProgress5 < 1.0 {
                downloadProgress5 += 0.015
                if downloadProgress5 >= 1.0 {
                    downloadProgress5 = 1.0
                    isDownloading5 = false
                }
            }
            
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

struct AnimatedDownloadButtons_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedDownloadButtons()
    }
}