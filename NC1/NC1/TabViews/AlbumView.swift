//
//  Album.swift
//  CouponCalendar
//
//  Created by Hyorim Nam on 2022/05/02.
//

import SwiftUI
import CoreData

struct AlbumView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Item.entity(), sortDescriptors: [NSSortDescriptor(key: "dueDate", ascending: true)]) var items: FetchedResults<Item>

    @State private var orderby = "date"
    @State private var testaction = false
    @State var isCouponView: Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Spacer()
                Picker("test", selection: $orderby){
                    Text("날짜별").tag("date")
                    Text("장소별").tag("place")
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 120)
                //이후: geometry reader 쓰기
                .padding()
                Spacer()
            }
            //숨김 캡슐?들 버튼?
                        
            //ForEach or Grid
            Group{ //Unused
                Text("2022년 5월 6일")
                    .font(.mainFont)
//                Text("Photos")
                HStack{
                    Image("g1").resizable().frame(width: 80, height: 80)
                        .onTapGesture {
                            isCouponView.toggle()
                        }
                    Image("g1").resizable().frame(width: 80, height: 80)
                        .onTapGesture {
                            isCouponView.toggle()
                        }
                }
            }
            Group{//Used
                Text("사용완료")
                Image("g1").resizable().frame(width: 80, height: 80).grayscale(1.0)
                Spacer()
            }
            
            Group{ //Unused
                Text("2022년 5월 7일")
                    .font(.mainFont)
//                Text("Photos")
                HStack{
                    Image("g1").resizable().frame(width: 80, height: 80)
                        .onTapGesture {
                            isCouponView.toggle()
                        }
                    Image("g1").resizable().frame(width: 80, height: 80)
                        .onTapGesture {
                            isCouponView.toggle()
                        }
                }
            }
            Spacer()
            Spacer()

        }.padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .sheet(isPresented: $isCouponView){
            CouponView(isCouponView: $isCouponView)
            }
    }
}

struct Album_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView()
    }
}
