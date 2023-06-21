//
//  CircleGroupView.swift
//  RESTART
//
//  Created by Sowad Hossain Rafi on 21/6/23.
//

import SwiftUI

// RESTART: - BODY
struct CircleGroupView: View {
    var body: some View {
        // Circle Group View
        ZStack {
            
            Circle()
                .stroke( .white.opacity(0.2), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            
            Circle()
                .stroke( .white.opacity(0.2), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        } //: ZStack
    }
}
// RESTART: - PREVIEW
struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            CircleGroupView()
        } //: ZStack
    }
}
