//
//  Addition.swift
//  CouponCalendar
//
//  Created by Hyorim Nam on 2022/05/02.
//

import SwiftUI
import CoreData
import Foundation
//import Photos
import PhotosUI

struct AdditionView: View {
    @State var nav = false
    
    var body: some View {
        NavigationView{
            ZStack{
                NavigationLink(destination: InsertionView(nav: $nav), isActive: $nav, label: {EmptyView()})
//                NavigationLink(destination: PhotoView(nav: $nav), isActive: $nav, label: {EmptyView()})
                Button(action: {
                    nav = true
                }){
                    VStack{
                        Text("\(Image(systemName: "plus.circle.fill"))").font(Font.system(size: 200))
                            .foregroundColor(.orangeColor)
                        Text("쿠폰 추가하기")
                            .font(.titleFont)
                            .foregroundColor(.black)
                    }
                }
            }.navigationBarHidden(true)
        }
    }
}

struct Addition_Previews: PreviewProvider {
    static var previews: some View {
        AdditionView()
    }
}
