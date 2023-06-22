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
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
    @State private var textTitle: String = "ঈদ মুবারক"
    @State private var bodyMessage: String = """
                    দানের পরিমাণ নয়, দান করার সময় আমরা কতটা ভালোবাসা দিয়ে দেই, সেটাই গুরুত্বপূর্ণ।
                    """
    let hapticFeedback = UINotificationFeedbackGenerator()
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
                    Text(textTitle)
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .transition(.opacity)
                        .id(textTitle) // We use ID method to tell SwiftUI that a view is NO LONGER the same view.
                        .padding(.all, 20)
                    
                    Text(bodyMessage)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .id(bodyMessage)
                    .padding(.horizontal, 10)
                } //: HEADER
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                // RESTART: - CENTER
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    // Image Area
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        // Accelerate the movement
                        .offset(x: imageOffset.width * 1.2, y: 0)
                        // ROTATION EFFCT GIVEN
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                        .gesture(
                            DragGesture()
                                .onChanged{ gesture in
                                    if abs(imageOffset.width) <= 150 {
                                        imageOffset = gesture.translation
                                        
                                        withAnimation(.linear(duration: 0.25)) {
                                            indicatorOpacity = 0
                                            textTitle = "EID MUBARAK"
                                            bodyMessage = """
It's not how much we give, but how much love we put into giving.
"""
                                        }
                                    }
                                }
                                .onEnded{_ in
                                    imageOffset = .zero
                                    
                                    withAnimation(.linear(duration: 0.25)) {
                                        indicatorOpacity = 1
                                        textTitle = "ঈদ মুবারক"
                                        bodyMessage = """
                    দানের পরিমাণ নয়, দান করার সময় আমরা কতটা ভালোবাসা দিয়ে দেই, সেটাই গুরুত্বপূর্ণ।
                    """

                                    }
                                }
                        ) //: GESTURE
                        .animation(.easeOut(duration: 1), value: imageOffset)
                } //: CENTER
                .overlay(
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44, weight: .ultraLight))
                        .foregroundColor(.white)
                        .offset(y: 20)
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
                        .opacity(indicatorOpacity)
                    , alignment: .bottom
                )
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
                                        hapticFeedback.notificationOccurred(.success)
                                        playSound(sound: "chimeup", type: "mp3")
                                        buttonOffset = buttonWidth - 80
                                        isOnboardingViewActive = false
                                    } else {
                                        hapticFeedback.notificationOccurred(.warning)
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
        .preferredColorScheme(.dark)
    }
}
// RESTART: - PREVIEW
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
