//
//  ContentView.swift
//  NC1
//
//  Created by Hyorim Nam on 2022/05/03.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @AppStorage("isFirst") var isFirst : Bool =  true
    
    var body: some View {
/*        Text("hw")
            .fullScreenCover(isPresented: $isFirst) {
                OnboardingTabView(isFirstLaunching: $isFirst)
            }
 */
        
        TabView {
            DebugView().tabItem{
                Image(systemName: "ladybug")
                Text("디버깅")
            }
            CalendarView().tabItem{
                Image(systemName: "calendar")
                Text("캘린더")
            }
            //추가사항: 캘린더를 2째에 두고 시작페이지로 하기
            AlbumView().tabItem{
                Image(systemName: "giftcard") //square.stack
                Text("앨범")
            }
            AdditionView().tabItem{
                Image(systemName: "plus.square.on.square")
                //or plus.square ... else
                Text("추가")
            }
            SettingView().tabItem{
                Image(systemName: "gear")
                Text("설정")
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
