# DrawerView-SwiftUI

 **A drawer view implemented by SwiftUI. This is not just simply a demo, instead, it can be directly used in project as a module as it has rudimentary customization flexibility.**
 
## To-Dos
- [ ] Fix the computed property error

## Introduction & Demo

### Basic Functionality Demo

*A drawer with some bouncing animation*

<img src="img/basic.gif" width="400">



### Further Step

#### Click Anywhere of the Background to Dismiss DrawerView

You can click anywhere of the darken background to dismiss the DrawerView

<img src="img/backdismiss.gif" width="400">

#### Drag to Dismiss DrawerView

* You can drag the draggable area to dismiss the DrawerView

  <img src="img/dragdismiss.gif" width="400"/>

* However, if the translation of drag action is shorter than you want, you can still restore the DrawerView.

  <img src="img/dragrestore.gif" width="400"/>

* Actually, you can even drag it up if you want. You can modify this behavior in the code.

  <img src="img/drag.gif" width="400"/>

## Usage

The entire `DrawerView` is coded in the file with the same name as `DrawerView.swift`. The setup code written in `Content.swift` which demonstrates how to use `DrawerView.swift`.

*`DrawerView` takes one required argument `isShow` to open and dismiss itself. You need to create one in your main view and bind it to `DrawerView`*

* Use `DrawerView` as `overlay`

  The code provided in the `Content.swift` uses `DrawerView` as a `overlay` of the main view.

  ``` swift
  VStack {
    // Create your own main view
  }
  .overlay(
    DrawerView(isShow: $isShow, content: SampleInnerView())
  )
  ```

* Use `DrawerView` in `ZStack`

  ``` swift
  ZStack {
    VStack {
      // Create your own main view
    }
    
    DrawerView(isShow: $isShow, content: SampleInnerView())
  }
  ```
  
  *In the above code, `content` is the inner view of `DrawerView`.*
  
  *For example:*

  ``` sw
  // file: SampleInnerView.swift
  struct SampleInnerView: View {
    var body: some View {
      Text("This is the inner view of DrawerView")
    }
  }
  ```



## Customization

*All customizable properties have been provided in the `DrawerView.swift`. You can directly assign the preferred value to these variables when you initialize the `DrawerView`*

* `backLayerColor`

* `backLayerOpacity`

* `backLayerAnimation`

* `drawerOrientation`

* `drawerHeight`

* `drawerWidth`

* `drawerCornerRadius`

* `drawerBackgroundColor`

* `drawerOutAnimation`

* `isDrawerShadowEnable`

* `drawerShadowRadius` 

  *If you want to customize this property, you need to set `isDrawerShadowEnable` to `true` first. By default, the animation of shadow is suppressed, but you can change it in source file.*

* `content`

  *This is property is required in the initializer. You can assign the view you want.*

* **To Be Continued**

## Contribution

This project is for demonstration purpose. Any contribution is welcome!

**Best Luck and Happy Coding!**

