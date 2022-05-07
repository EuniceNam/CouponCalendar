//
//  InsertionView.swift
//  NC1
//
//  Created by Hyorim Nam on 2022/05/05.
//

import SwiftUI
import CoreData

struct InsertionView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
//    @FetchRequest(entity: Item.entity(), sortDescriptors: []) var items: FetchedResults<Item>
    
    @State var tmpTF: [String] = ["", "", ""]
    @State var dueDate : Date = Date()
    @State var tmpgfTF: [String] = ["", "", ""]
    @State var tmpMm: String = ""
    @State var placeType = PlaceType.etc
    
    @Binding var nav: Bool
    
    //사진은 가져와야함
//    let pictureURI =

    let labels = ["쿠폰 이름", "사용처", "바코드번호"] //필수
    let giftlabels = ["보낸이", "이유", "일자"]
    let guideStr = "을 입력하세요" //이후: 을/를 구분 <- func로
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack(alignment: .leading){
                    
                    Text("새 쿠폰 입력하기")
                        .font(.titleFont)
                        .padding(.bottom)
                    Group{
                        HStack{
                            Text(labels[0]).frame(width: 80, alignment: .leading)
                            TextField(labels[0]+guideStr, text: $tmpTF[0])
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.vertical, -4)
                        }
                        HStack{
//                                Text("사용기한").frame(width: 80, alignment: .leading)
                            DatePicker(
                                "사용기한",
                                selection: $dueDate,
                                displayedComponents: [.date]
                            ).datePickerStyle(.compact)
                        }
                        HStack{
                            Text(labels[1]).frame(width: 80, alignment: .leading)
                            TextField(labels[1]+guideStr, text: $tmpTF[1])
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.vertical, -4)
                        }
                    }

                    HStack{
                        Text("분류").font(.subFont).lineLimit(1).frame(width: 60, alignment: .center)
                        //이후: 버튼으로 변경?
                        
                        Picker("PlaceType", selection: $placeType){
                            Text("카페")
                                .font(.subFont).tag(PlaceType.cafe)
                            Text("음식점")
                                .font(.subFont).tag(PlaceType.restaurant)
                                .allowsTightening(true)
                            Text("편의점")
                                .font(.subFont).tag(PlaceType.convenience)
                                .allowsTightening(true)
                                .frame(width: 30)
                            Text("기타")
                                .font(.subFont).tag(PlaceType.etc)
                                .allowsTightening(true)
                        }.padding(.leading)
                        .pickerStyle(SegmentedPickerStyle())
                    }.padding(.top, -4.0)
//                        Group{
                        HStack{
                            Text("선물")
                            Button(action: {
                                //밑에 선물 정보 띄우기
                            }){
                                Text("정보 입력하기")
                                    .font(.subFont)
                                    .foregroundColor(.black)
                                    .padding(.horizontal, 10.0)
                                    .padding(.vertical, 2)
                                    .background(Color(.systemGray5), in: Capsule())
                            }
                        }
                    //접혀있다가 펴지기
//                            let giftlabels = ["보낸이", "이유", "일자"]
//                            ForEach(0...2, id: \.self){ i in
//                                HStack{
//                                    Text(giftlabels[i]).frame(width: 80, alignment: .leading)
//                                    TextField(giftlabels[i]+guideStr, text: $tmpgfTF[i])
//                                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                                        .padding(.vertical, -4)
//                                }.padding(.leading)
//                            }
//                        }
                    Text("메모").padding(.top)
                    TextField("메모할 내용"+guideStr, text: $tmpMm)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.leading)
                    HStack{
                        Text(labels[2]).frame(width: 80, alignment: .leading)
                        TextField(labels[2]+guideStr, text: $tmpTF[2])
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.vertical, -4)

                    }.padding(.vertical)

                    Text("사진")
//                        AsyncImage(url: URL()).resizable().scaledToFit().padding()
                    Image("g1").resizable().scaledToFit().padding()
            }
                .ignoresSafeArea()
                    .padding()
            }
                VStack{
                    Spacer()
                    HStack{
                        Spacer()
                        Button(action: {
                            clearTF()
                            nav.toggle()
                        }){
                            Text("취소")
                        }.foregroundColor(.black)
                            .frame(width: 60)
                            .padding()
                            .background(Color(.systemGray4), in: Capsule())
                        
                        Button(action: {
//                            if !checkRequiredField(){
//                                Alert(title: "사용기한을 입력해주세요", dismissButton: .default(Text("OK")))
//                            }else{
                            addNewCoupon(required: tmpTF, dueDate: dueDate, placetype: placeType.rawValue ?? 3, context: viewContext)
                            clearTF()
                            nav.toggle()
//                            }
                        }){
                            Text("완료")
                                .foregroundColor(.black)
                                .frame(width: 120)
                                    .padding()
                                    .background(Color.orangeColor, in: Capsule())
                        }
                        Spacer()
                    }.padding()
                        .background(.white.opacity(0.5))
                }
            }
        .navigationBarHidden(true)
    
    }
    
    
    func clearTF(){
        tmpTF = ["", "", "", "", ""]
        tmpgfTF = ["", "", ""]
        tmpMm = ""
    }

    func addNewCoupon(required: [String], dueDate: Date, placetype: PlaceType.RawValue, context: NSManagedObjectContext){
        let coupon = Item(context: context)
        coupon.id = UUID()
        coupon.name = required[0]
        coupon.dueDate = dueDate
        coupon.place = required[1]
        coupon.barcodeNumber = required[2]
        coupon.placeCategory = placetype
        
        save(context: context)
    }
}

struct InsertionView_Previews: PreviewProvider {
    static var previews: some View {
        InsertionView(nav: .constant(true))
    }
}
