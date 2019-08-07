//
//  BottomDrawerView.swift
//  BottomDrawerView
//
//  Created by Quentin on 2019/8/8.
//  Copyright © 2019 Quentin. All rights reserved.
//

import SwiftUI

struct BottomDrawerView: View {
    @Binding var isShow: Bool
    
    var body: some View {
        VStack {
            Text("This is drawer")
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        .background(Color.blue)
        .cornerRadius(20)
        .offset(y: isShow ? UIScreen.main.bounds.height * 0.25 : UIScreen.main.bounds.height * 0.75)
        .animation(.interpolatingSpring(mass: 1, stiffness: 50, damping: 50, initialVelocity: 10))
    }
}

#if DEBUG
struct BottomDrawerView_Previews: PreviewProvider {
    static var previews: some View {
        BottomDrawerView(isShow: .constant(true))
    }
}
#endif
