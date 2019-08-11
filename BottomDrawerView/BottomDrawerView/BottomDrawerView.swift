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
    
    // The default color of back layer
    var backLayerColor = Color.black
    
    // The default opacity of back layer when the drawer is pulled out
    var backLayerOpacity = 0.5
    
    // Use the default animation of back layer
    var backLayerAnimation = Animation.default
    
    // The default orientation of drawer
    var drawerOrientation = Axis.Set.vertical
    
    // The default height of drawer
    // Will be used when orientation set to be VERTICAL
    var drawerHeight = UIScreen.main.bounds.height / 2
    
    // The default width of drawer
    // Will be used when orientation set to be HORIZANTAL
    var drawerWidth = UIScreen.main.bounds.width / 2
    
    // The default value of corner radius of drawer view
    var drawerCornerRadius: CGFloat = 20
    
    // The default color of the background of drawer view
    var drawerBackgroundColor = Color.blue
    
    // The default animation of opening up drawer view
    var drawerOutAnimation = Animation.interpolatingSpring(mass: 0.5, stiffness: 45, damping: 45, initialVelocity: 15)
    
    
    var body: some View {
        ZStack {
            // Implement the darken background
            if isShow {
                Rectangle()
                    .foregroundColor(backLayerColor).opacity(backLayerOpacity)
                    .animation(backLayerAnimation)
                    .onTapGesture {
                        // The default behavior of tapping on
                        // the back layer is dismiss the drawer
                        self.isShow.toggle()
                    }
            }

            VStack {
                // The inner content of the drawer
                // Be creative!
                Text("This is the inner drawer view")
            }
            .frame(
                width: drawerOrientation == Axis.Set.horizontal
                    ? drawerWidth
                    : UIScreen.main.bounds.width,
                height: drawerOrientation == Axis.Set.vertical
                    ? drawerHeight
                    : UIScreen.main.bounds.height)
            .background(drawerBackgroundColor)
            .cornerRadius(drawerCornerRadius)
            .offset(y: isShow ? UIScreen.main.bounds.height * 0.25 : UIScreen.main.bounds.height * 0.75)
            .animation(drawerOutAnimation)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct BottomDrawerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BottomDrawerView(isShow: .constant(false))
            BottomDrawerView(isShow: .constant(true))
        }
    }
}
#endif
