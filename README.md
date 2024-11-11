# EasySkeleton

[![Swift](https://img.shields.io/badge/Swift-5.9-orange?style=flat-square)](https://img.shields.io/badge/Swift-5.-Orange?style=flat-square)
[![Platforms](https://img.shields.io/badge/Platforms-macOS_iOS_tvOS_watchOS_visionOS-green?style=flat-square)](https://img.shields.io/badge/Platforms-macOS_iOS_tvOS_watchOS_visionOS-green?style=flat-square)

Fast and lightweight skeleton framework for SwiftUI!

![Example](https://github.com/SpectralDragon/EasySkeleton/blob/main/Resources/example.gif?raw=true)
![Example](https://github.com/SpectralDragon/EasySkeleton/blob/main/Resources/vision.png?raw=true)

## How to use

We use a simple system with environment to pass information about the skeleton across all the views, but you should tell your layout where and how it should be displayed. Some examples:

```swift

import EasySkeleton

struct ContentView: View {

    @State private var isLoading = true
    
    var body: some View {
        VStack {
            Text("Some title")
                .skeletonable() // This text will be skeletonable 
                
            Text("Body")
                .skeletonable() // This text will be skeletonable too
        }
        .setSkeleton($isLoading) // Control skeletonable state
    }
}
```

But what if you want to design your own skeleton? You can do so with modifiers:

```swift

Text("Some title")
    .skeletonable()
    .skeletonCornerRadius(16) // Your skeleton will be rounded. Great!

```

And what if for example, you want to use a custom style or animation ? Its easy! Just use the extra arguments in your `setSkeleton` method:


```swift

struct ContentView {

    @State private var isLoading = true

    var body: some View {
        VStack {
            /// ...
        }
        .setSkeleton(
            $isLoading,
            animationType: .solid(Color.blue), // by default is .gradient(Color.skeleton.makeGradient())
            animation: Animation.default, // Default animation
            transition: AnyTransition.opacity // Transition how skeleton appears or disappers.
        )
    }   

}

```

To disable the skeleton in your child views just call the `unskeletonable` method

```swift

struct Row {

    var body: some View {
        VStack {
            /// ...
        }
        .unskeletonable() // Your view will not be skeletonable 
    }   

}

struct ContentView: View {
    var body: some View {
        Row()
            .skeletonable() // Doesn't apply on Row 
    }   
}

```

EasySkeleton it a great fit to work with ForEach loops. You can apply the native ForEach and modify it with the `skeletonForEach` modifier:

```swift
struct NewsView: View {
    var body: some View {
        ForEach(items) {
            NewsRow(item: $0)
        }
        .skeletonForEach(itemsCount: 4) { _ in // only applies on ForEach component to avoid using `SkeletonForEach` or similar component
            NewsRow()
                .skeletonFrame(height: 56) // Set frame for skeleton overlay, but also, you can set native `frame()` modifier.
        }
    }   
}
```

And last, but not least! The main killer feature: Reading your skeleton state on the fly using Environment feature!

```swift

struct Header: View {

    @Environment(\.skeleton) private var skeleton // You can grab skeleton state from any view!

    var body: some View {
        Button("Press to me") {
            /// ...
        }
        .disabled(skeleton.isSkeletonActive) // Control your layout when skeleton is active!
    }
}

```

## Contributing

You're welcome to change that library and I hope we will make a best tool for any developer!
