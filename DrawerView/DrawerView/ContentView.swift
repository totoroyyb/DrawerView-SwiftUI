//
//  ContentView.swift
//  BottomDrawerView
//
//  Created by Quentin on 2019/8/8.
//  Copyright © 2019 Quentin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isShow = false
    
    var body: some View {
        VStack {
            Text("This is a bottom drawer view demo")
            Button(action: {
                self.isShow.toggle()
            }) {
                Text("Click to present")
            }
            
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.red)
        .overlay(DrawerView(isShow: $isShow))
    }
}

struct InnerDrawerView: View {
    var body: some View {
        Text("Hello")
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
