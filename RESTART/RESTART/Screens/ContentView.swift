//  ContentView.swift
//  RESTART
//
//  Created by Sowad Hossain Rafi on 20/6/23.

import SwiftUI

struct ContentView: View {
    // SOWAD: - PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    // SOWAD: - BODY
    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}
// SOWAD: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 14 Pro Max")
    }
}
