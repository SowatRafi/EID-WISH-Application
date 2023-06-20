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
        VStack(spacing: 20) {
            Text("Home").font(.largeTitle)
            // Button
            Button(action: {
                isOnboardingViewActive = true
            }) //: Button
            { // Text
                Text("Restart")
            } //: Text
            
        } //: VStack
    }
}
// SOWAD: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
