//
//  SampleDrawerInnerView.swift
//  DrawerView
//
//  Created by Quentin on 2019/8/17.
//  Copyright © 2019 Quentin. All rights reserved.
//

import SwiftUI

struct SampleDrawerInnerView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Text("This is the inner drawer view")
            
            Spacer()
        }
    }
}

#if DEBUG
struct SampleDrawerInnerView_Previews: PreviewProvider {
    static var previews: some View {
        SampleDrawerInnerView()
    }
}
#endif
