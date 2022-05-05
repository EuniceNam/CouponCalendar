//
//  Setting.swift
//  CouponCalendar
//
//  Created by Hyorim Nam on 2022/05/02.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        VStack(alignment: .leading){
            Group{
                Text(Image(systemName: "gear")) + Text(" 설정")
            }
            .padding()
            List{
                //이미지와 액션 추가하기
                Text("알림 추가")
                Text("알림 시간")
                Text("도움말 다시보기")
                Text("전체 삭제")
            }
            
        }
    }
}

struct Setting_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
