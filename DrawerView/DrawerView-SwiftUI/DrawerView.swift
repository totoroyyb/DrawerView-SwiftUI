//
//  BottomDrawerView.swift
//  BottomDrawerView
//
//  Created by Quentin on 2019/8/8.
//  Copyright © 2019 Quentin. All rights reserved.
//

import SwiftUI

struct DrawerView<Content: View>: View {
    @Binding var isShow: Bool
    
    @State private var translation = CGSize.zero
    
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
    var drawerHeight: CGFloat?
    
    private var computedDrawerHeight: CGFloat {
        if let height = drawerHeight {
            return height
        }
        return UIScreen.main.bounds.height / 2
    }
    
    // The default width of drawer
    // Will be used when orientation set to be HORIZANTAL
    var drawerWidth: CGFloat?
    
    private var computedDrawerWidth: CGFloat {
        if let width = drawerWidth {
            return width
        }
        return UIScreen.main.bounds.width / 2
    }
    
    // The default value of corner radius of drawer view
    var drawerCornerRadius: CGFloat = 20
    
    // The default color of the background of drawer view
    var drawerBackgroundColor = Color.blue
    
    // The default animation of opening up drawer view
    var drawerOutAnimation = Animation.interpolatingSpring(mass: 0.5, stiffness: 45, damping: 45, initialVelocity: 15)
    
    var isDrawerShadowEnable = true
    
    var drawerShadowRadius: CGFloat = 20
    
    var content: Content
    
    private var xOffset: CGFloat {
        if drawerOrientation == Axis.Set.horizontal {
            let origOffset = isShow ? -(UIScreen.main.bounds.width - computedDrawerWidth) / 2 : -(UIScreen.main.bounds.width + computedDrawerWidth) / 2
            return origOffset - translation.width
        }
        return 0
    }
    
    private var initYOffset: CGFloat? {
        if drawerOrientation == Axis.Set.vertical {
            return isShow ? (UIScreen.main.bounds.height - computedDrawerHeight ) / 2 : (UIScreen.main.bounds.height + computedDrawerHeight ) / 2
        }
        return nil
    }
    
    private var yOffset: CGFloat {
        if let y = initYOffset {
            return y + translation.height
        }
        return 0
    }
    
    var body: some View {
        ZStack {
            // Implement the darken background
            if isShow {
                Rectangle()
                    .foregroundColor(backLayerColor)
                    .opacity(backLayerOpacity)
                    .animation(backLayerAnimation)
                    .onTapGesture {
                        // The default behavior of tapping on
                        // the back layer is dismissing the drawer
                        self.isShow.toggle()
                    }
            }

            VStack {
                // The inner content of the drawer
                // Be creative!
                VStack {
                    Text("This is a draggable area")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 40)
                .background(
                    RoundedRectangle(cornerRadius: drawerCornerRadius)
                        .stroke(lineWidth: 1)
                )
                .gesture(
                    DragGesture()
                        .onChanged { (value) in
                            self.translation = value.translation
                        }
                        .onEnded { (value) in
                            switch self.drawerOrientation {
                            case Axis.Set.vertical:
                                if value.translation.height > 20 {
                                    self.isShow.toggle()
                                }
                                
                            case Axis.Set.horizontal:
                                if value.translation.width < -20 {
                                    self.isShow.toggle()
                                }
                            default:
                                break
                            }
                            self.translation = CGSize.zero
                        }
                )
                
                content
            }
            .frame(
                width: drawerOrientation == Axis.Set.horizontal
                    ? computedDrawerWidth
                    : UIScreen.main.bounds.width,
                height: drawerOrientation == Axis.Set.vertical
                    ? computedDrawerHeight
                    : UIScreen.main.bounds.height)
            .background(drawerBackgroundColor)
            .cornerRadius(drawerCornerRadius)
            .shadow(radius: isDrawerShadowEnable ? drawerShadowRadius : 0)
            .offset(x: xOffset, y: yOffset)
            .animation(drawerOutAnimation)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct BottomDrawerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DrawerView(isShow: .constant(false), content: SampleDrawerInnerView())
                .previewDisplayName("Drawer is Closed, Vertical")
            
            DrawerView(isShow: .constant(true), content: SampleDrawerInnerView())
                .previewDisplayName("Drawer is Opened, Vertical")
            
//            DrawerView(isShow: .constant(false), drawerOrientation: Axis.Set.horizontal)
//            .previewDisplayName("Drawer is Closed, Horizontal")
//
//            DrawerView(isShow: .constant(true), drawerOrientation: Axis.Set.horizontal)
//            .previewDisplayName("Drawer is Opened, Horizontal")
        }
    }
}
#endif
