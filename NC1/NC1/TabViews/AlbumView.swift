//
//  Album.swift
//  CouponCalendar
//
//  Created by Hyorim Nam on 2022/05/02.
//

import SwiftUI

struct AlbumView: View {
    @State private var orderby = "date"
    @State private var testaction = false
    var body: some View {
        VStack(alignment: .leading){
            Picker("test", selection: $orderby){
                Text("날짜별").tag("date")
                Text("장소별").tag("place")
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 120)
            //이후: geometry reader 쓰기
            .padding()
            
            //숨김 캡슐?들 버튼?
            
            //for test
            Button("test"){
                testaction = true
            }
            
            //ForEach or Grid
            Group{ //Unused
                Text("Date")
                Text("Photos")
                Spacer()

            }
            Spacer()
            Group{//Used
            
                Text("사용완료")
                Text("Photos")
                Spacer()
            }
        }
    }
}

struct Album_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView()
    }
}
