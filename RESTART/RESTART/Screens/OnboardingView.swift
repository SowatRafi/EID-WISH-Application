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
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero    // RESTART: - BODY
    var body: some View {
        // ZStack
        ZStack {
            Color("ColorBlue").ignoresSafeArea(.all, edges: .all)
            // VStack
            VStack(spacing: 20) {
                // RESTART: - HEADER
                Spacer()
                
                VStack(spacing: 0) {
                    Text("ঈদ মুবারক")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.bottom, 20)
                    
                    Text("EID MUBARAK")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.all)
                        .opacity(0.7)
                    
                    Text("""
It's not how much we give, but how much love we put into giving.
""")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                } //: HEADER
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                // RESTART: - CENTER
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        // Accelerate the movement
                        .offset(x: imageOffset.width * 1.2, y: 0)
                        .gesture(
                            DragGesture()
                                .onChanged{ gesture in
                                    if abs(imageOffset.width) <= 87 {
                                        imageOffset = gesture.translation
                                    }
                                }
                                .onEnded{_ in
                                    imageOffset = .zero
                                }
                        ) //: GESTURE
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
                            .frame(width: buttonOffset + 80)
                        
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
                        } //: ZStack
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
                                withAnimation(Animation.easeOut(duration: 0.4)) {
                                    if buttonOffset > buttonWidth / 2 {
                                        buttonOffset = buttonWidth - 80
                                        isOnboardingViewActive = false
                                    } else {
                                        buttonOffset = 0
                                        
                                    }
                                }
                            }
                    ) //: GESTURE
                        
                        Spacer()
                    } //: HStack
                    
                } //: ZStack
                //: FOOTER
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
            } //: VStack
        } //: ZStack
        .onAppear(perform: {
            isAnimating = true
        })
    }
}
// RESTART: - PREVIEW
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
