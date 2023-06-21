//
//  HomeView.swift
//  RESTART
//
//  Created by Sowad Hossain Rafi on 20/6/23.
//

import SwiftUI

struct HomeView: View {
    // SOWAD: - PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    // SOWAD: - BODY
    var body: some View {
        // VStack
        VStack {
            // RESTART - HEADER
            Spacer()
            Image("character-2")
                .resizable()
                .scaledToFit()
                .padding()
            // RESTART - CENTER
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            // RESTART - FOOTER
            Spacer()
                // Button
                Button(action: {
                    isOnboardingViewActive = true
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
        } //: BODY
    }
// SOWAD: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
