//
//  OnboardingView.swift
//  RESTART
//
//  Created by Sowad Hossain Rafi on 20/6/23.
//

import SwiftUI

struct OnboardingView: View {
    // RESTART: - PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    // RESTART: - BODY
    var body: some View {
        // ZStack
        ZStack {
            Color("ColorBlue").ignoresSafeArea(.all, edges: .all)
            // VStack
            VStack(spacing: 20) {
                // RESTART: - HEADER
                Spacer()
                
                VStack(spacing: 0) {
                    Text("Share")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("""
It's not how much we give but how much love we put into giving.
""")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                } //: HEADER
                // RESTART: - CENTER
                ZStack {
                    ZStack {
                        
                        Circle()
                            .stroke( .white.opacity(0.2), lineWidth: 40)
                            .frame(width: 260, height: 260, alignment: .center)
                        
                        Circle()
                            .stroke( .white.opacity(0.2), lineWidth: 80)
                            .frame(width: 260, height: 260, alignment: .center)
                    } //: ZStack
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                } //: CENTER
                // RESTART: FOOTER
            } //: VStack
        } //: ZStack
    }
}
// RESTART: - PREVIEW
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
