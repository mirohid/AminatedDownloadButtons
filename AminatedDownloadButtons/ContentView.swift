//
//  ContentView.swift
//  AminatedDownloadButtons
//
//  Created by MacMini6 on 04/03/25.
//


//import SwiftUI
//
//struct ContentView: View {
//    @State private var animateTitle = false
//
//    var body: some View {
//        NavigationStack {
//            ScrollView {
//                VStack(spacing: 60) {
//                    // Animated Title
//                    Text("Animated Download Buttons")
//                        .font(.title)
//                        .bold()
//                        .frame(width: 380, height: 60)
//                        .background(Color.gray.opacity(0.7))
//                        .cornerRadius(10)
//                        .padding()
//                        .opacity(animateTitle ? 1 : 0)
//                        .scaleEffect(animateTitle ? 1 : 0.8)
//                        .animation(.easeIn(duration: 1), value: animateTitle)
//                        .onAppear {
//                            animateTitle = true
//                        }
//
//                    VStack(spacing: 20) {
//                        ForEach(0..<6, id: \.self) { index in
//                            AnimatedNavigationButton(
//                                title: "Button \(index + 1)",
//                                color: getColor(index),
//                                destination: getDestination(index)
//                            )
//                            .padding(.horizontal)
//                            .scaleEffect(animateTitle ? 1 : 0.5)
//                            .animation(
//                                .spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.5)
//                                .delay(Double(index) * 0.1),
//                                value: animateTitle
//                            )
//                        }
//                    }
//                }
//            }
//        }
//    }
//
//    func getColor(_ index: Int) -> Color {
//        let colors: [Color] = [.red, .blue, .green, .orange, .black, .purple]
//        return colors[index % colors.count]
//    }
//
//    @ViewBuilder
//    func getDestination(_ index: Int) -> some View {
//        switch index {
//        case 0: ButtonView1()
//        case 1: ButtonView2()
//        case 2: ButtonView3()
//        case 3: ButtonView4()
//        case 4: ButtonView5()
//        case 5: ButtonView6()
//        default: Text("Unknown View")
//        }
//    }
//}
//
//struct AnimatedNavigationButton<Destination: View>: View {
//    var title: String
//    var color: Color
//    var destination: Destination
//    @State private var isPressed = false
//
//    var body: some View {
//        NavigationLink(destination: destination) {
//            Text(title)
//                .foregroundStyle(.white)
//                .bold()
//                .font(.title2)
//                .frame(width: 280, height: 60)
//                .background(color)
//                .cornerRadius(20)
//                .scaleEffect(isPressed ? 1.1 : 1.0)
//                .animation(.easeOut(duration: 0.2), value: isPressed)
//        }
//        .simultaneousGesture(
//            LongPressGesture(minimumDuration: 0.1)
//                .onChanged { _ in isPressed = true }
//                .onEnded { _ in isPressed = false }
//        )
//    }
//}
//
//#Preview {
//    ContentView()
//}

import SwiftUI

struct ContentView: View {
    @State private var animateTitle = false
    @State private var animateBackground = false

    var body: some View {
        NavigationStack {
            ZStack {
                // Animated Background
                LinearGradient(
                    gradient: Gradient(colors: animateBackground ? [.blue, .purple] : [.pink, .orange]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 3).repeatForever(autoreverses: true), value: animateBackground)

                ScrollView {
                    VStack(spacing: 60) {
                        // Animated Title
                        Text("🔥 Animated Buttons 🔥")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                            .shadow(radius: 10)
                            .scaleEffect(animateTitle ? 1 : 0.5)
                            .opacity(animateTitle ? 1 : 0)
                            .animation(.easeInOut(duration: 1), value: animateTitle)
                            .onAppear {
                                animateTitle = true
                                animateBackground = true
                            }

                        VStack(spacing: 20) {
                            ForEach(0..<6, id: \.self) { index in
                                AnimatedNavigationButton(
                                    title: "Button \(index + 1) 🚀",
                                    color: getColor(index),
                                    destination: getDestination(index)
                                )
                                .padding(.horizontal)
                                .scaleEffect(animateTitle ? 1 : 0.5)
                                .opacity(animateTitle ? 1 : 0)
                                .animation(
                                    .spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.5)
                                    .delay(Double(index) * 0.1),
                                    value: animateTitle
                                )
                            }
                        }
                    }
                    .padding(.top, 50)
                }
            }
        }
    }

    func getColor(_ index: Int) -> Color {
        let colors: [Color] = [.red, .blue, .green, .orange, .black, .purple]
        return colors[index % colors.count]
    }

    @ViewBuilder
    func getDestination(_ index: Int) -> some View {
        switch index {
        case 0: ButtonView1()
        case 1: ButtonView2()
        case 2: ButtonView3()
        case 3: ButtonView4()
        case 4: ButtonView5()
        case 5: ButtonView6()
        default: Text("Unknown View")
        }
    }
}

struct AnimatedNavigationButton<Destination: View>: View {
    var title: String
    var color: Color
    var destination: Destination
    @State private var isPressed = false
    @State private var shimmer = false

    var body: some View {
        NavigationLink(destination: destination) {
            Text(title)
                .foregroundColor(.white)
                .bold()
                .font(.title2)
                .frame(width: 280, height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(color)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white.opacity(0.3), lineWidth: 2)
                        )
                        .shadow(color: color.opacity(0.7), radius: isPressed ? 10 : 5, x: 0, y: 5)
                )
                .scaleEffect(isPressed ? 1.1 : 1.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: [.white.opacity(0.5), .clear]),
                                startPoint: .leading,
                                endPoint: .trailing
                            ),
                            lineWidth: 3
                        )
                        .opacity(shimmer ? 1 : 0)
                        .offset(x: shimmer ? 150 : -150)
                        .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: shimmer)
                )
                .onAppear {
                    shimmer = true
                }
                .animation(.easeOut(duration: 0.2), value: isPressed)
        }
        .simultaneousGesture(
            LongPressGesture(minimumDuration: 0.1)
                .onChanged { _ in isPressed = true }
                .onEnded { _ in isPressed = false }
        )
    }
}

#Preview {
    ContentView()
}
