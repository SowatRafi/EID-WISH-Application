//
//  OnboardingView.swift
//  RESTART
//
//  Created by Sowad Hossain Rafi on 20/6/23.
//

import SwiftUI

struct OnboardingView: View {
    // SOWAD: - PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    // SOWAD: - BODY
    var body: some View {
        // VStack
        VStack(spacing: 20) {
            Text("Onboarding").font(.largeTitle)
            // Button
            Button(action: {
                isOnboardingViewActive = false
            }) //: Button
            { // Text
                Text("Start")
            } //: Text
            
        } //: VStack
    }
}
// SOWAD: - PREVIEW
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
