//  HomeView.swift
//  RESTART

//  Created by Sowad Hossain Rafi on 20/6/23.

import SwiftUI

struct HomeView: View {
    // SOWAD: - PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    // SOWAD: - BODY
    var body: some View {
        // VStack
        VStack {
            // RESTART - HEADER
            Spacer()
            
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                Image("character-3")
                    .resizable()
                    .scaledToFit()
                .padding()
                .offset(y: isAnimating ? 20 : -10)
                .animation(
                    Animation
                        .easeInOut(duration: 4)
                        .repeatForever()
                    , value: isAnimating
                )
            }
            // RESTART - CENTER
            // Text 01
            Text("Be patient and kind to others.")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(.secondary)
                .opacity(0.7)
                .multilineTextAlignment(.center)
                .padding()
            // Text 02
            Text("Eid Ul Adzha is a time to be patient and kind to others. Be understanding of those who may be struggling, and help out where you can.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.all)
            // RESTART - FOOTER
            Spacer()
                // Button
                Button(action: {
                    withAnimation{
                        isOnboardingViewActive = true
                    }
                }) //: Button
                {
                    // Image
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                    // Text
                    Text("Restart")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                } //: BUTTON
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
            } //:VStack
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : -40)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear(perform: {
            // DispatchQueue: An object that manages the execution of tasks serially or concurrently on app's main thread or on background thread.
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
        } //: BODY
    }
// SOWAD: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
