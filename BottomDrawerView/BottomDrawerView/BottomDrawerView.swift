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
        ZStack {
            if isShow {
                Rectangle()
                    .foregroundColor(.black).opacity(0.5)
                    .animation(.default)
                    .onTapGesture {
                        self.isShow.toggle()
                    }
            }

            VStack {
                Text("This is drawer")
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
            .background(Color.blue)
            .cornerRadius(20)
            .offset(y: isShow ? UIScreen.main.bounds.height * 0.25 : UIScreen.main.bounds.height * 0.75)
            .animation(.interpolatingSpring(mass: 0.5, stiffness: 45, damping: 45, initialVelocity: 15))
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct BottomDrawerView_Previews: PreviewProvider {
    static var previews: some View {
        BottomDrawerView(isShow: .constant(false))
    }
}
#endif
