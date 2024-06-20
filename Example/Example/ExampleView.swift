//
//  ExampleView.swift
//  
//
//  Created by v.prusakov on 10/27/22.
//

import SwiftUI
import EasySkeleton

struct ExampleView: View {
    
    @State private var isSkeletonActive = true
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    HeaderView()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Big announcement!!")
                            .font(.title)
                            .foregroundColor(.white)
                        
                        Text("Pay now, get latter!")
                            .font(.body)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.all, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.accentColor)
                    )
                    .padding(.bottom, 16)
                    .skeletonable()
                    
                    ForEach(0..<10, id: \.self) { index in
                        self.cell(at: index)
                    }
                    .skeletonForEach(itemsCount: 5) { index in
                        self.cell(at: index)
                    }
                    
                    Spacer()
                }
            }
            .padding(.bottom, 32)
            .skeletonCornerRadius(16, style: .continuous)
            .setSkeleton(
                self.$isSkeletonActive,
                animation: Animation.default,
                transition: AnyTransition.opacity
            )
            
            self.skeletonControlButton
        }
        .padding(.all)
        .frame(minWidth: 348, minHeight: 400)
    }
    
    @ViewBuilder
    private var skeletonControlButton: some View {
        VStack {
            
            Spacer()
            
            HStack {
                
                Spacer()
                
                Button {
                    withAnimation {
                        self.isSkeletonActive.toggle()
                    }
                } label: {
                    Text("Skeleton Active: \(isSkeletonActive ? "Yes" : "No")")
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, idealHeight: 56)
            .background(Color.white)
        }
    }
    
    private func cell(at index: Int) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Element at index \(index)")
                .font(.body)
                .skeletonable()
            
            Text("Some text")
                .font(.caption)
                .skeletonable()
        }
        .unskeletonable()
    }
}

struct HeaderView: View {
    
    @Environment(\.skeleton) private var skeleton
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Hello there!")
                    .font(.largeTitle)
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Text("ES")
                        .font(.system(size: 17))
                        .frame(width: 48, height: 48)
                        .overlay(
                            RoundedRectangle(cornerRadius: 18, style: .continuous)
                                .stroke(Color.skeleton)
                        )
                })
                .buttonStyle(.plain)
                .skeletonable()
                .disabled(skeleton.isSkeletonActive)
            }
            
            Text("Easy Skeleton")
                .skeletonable()
                .skeletonLinesCount(2)
        }
        
    }
}

#Preview {
    ExampleView()
}
