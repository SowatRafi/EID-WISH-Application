//  OnboardingView.swift
//  RESTART
//
//  Created by Sowad Hossain Rafi on 20/6/23.

import SwiftUI

struct OnboardingView: View {
    // RESTART: - PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
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
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                } //: CENTER
                // RESTART: FOOTER
                ZStack {
                    // PARTS OF THE CUSTOM BUTTON
                    
                    // 1. BACKGROUND (STATIC)
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    // 2. CALL-TO-ACTION (STATIC)
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    // 3. CAPSULE (DYNAMIC WIDTH)
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: 80)
                        Spacer()
                    }
                    // 4. CIRCLE (DRAGGABLE)
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                    .frame(width: 80, height: 80, alignment: .center)
                    .offset(x: buttonOffset)
                    .gesture(
                        DragGesture()
                            .onChanged{gesture in
                                //          It will only run when the draggin has been started in the right direction.
                                // && (condition) prevents the red button to go outside
                                if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                    // We are capturing the actual drag movement's width for later use.
                                    buttonOffset = gesture.translation.width
                                }
                            }
                            .onEnded{ _ in
                                buttonOffset = 0
                            }
                    ) //: GESTURE
                        
                        Spacer()
                    }
                    
                } //: ZStack //: FOOTER
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
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
