//
//  CircleGroupView.swift
//  RESTART
//
//  Created by Sowad Hossain Rafi on 21/6/23.
//

import SwiftUI

// Circle Group View
struct CircleGroupView: View {
    // RESTART: - PROPERTY
    @State var ShapeColor: Color?
    @State var ShapeOpacity: Double?
    // RESTART: - BODY
    var body: some View {
        ZStack {
            
            Circle()
                .stroke(
                    ShapeColor?.opacity(ShapeOpacity ?? 0.2) ?? .black,
                    lineWidth: 40
                )
                .frame(width: 260, height: 260, alignment: .center)
            
            Circle()
                .stroke(
                    ShapeColor?.opacity(ShapeOpacity ?? 0.2) ?? .black,
                    lineWidth: 80
                )
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
            
            CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
        } //: ZStack
    }
}
