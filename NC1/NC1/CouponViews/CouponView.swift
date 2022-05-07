//
//  CouponView.swift
//  NC1
//
//  Created by Hyorim Nam on 2022/05/04.
//

import SwiftUI
import CoreData

struct CouponView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Item.entity(), sortDescriptors: [NSSortDescriptor(key: "dueDate", ascending: true)]) var items: FetchedResults<Item>
    
    @Binding var isCouponView: Bool
            
    func leftDays()->Int{
        if let a = items.first{
            let dd = a.dueDate!.timeIntervalSinceNow
            return Int(dd/86400)
        }
        else{ return 0}
    }
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("D-\(leftDays())").font(.mainFont)
                Spacer()
                Spacer()
                Text("공유중").foregroundColor(Color(.systemGray4))
                Spacer()
            }.padding()
            ScrollView{
                VStack(alignment: .leading){
                    if items.first?.isUsed == true {
                        Image("g1").resizable().scaledToFit().grayscale(1.0).padding()
                    }else{
                        Image("g1").resizable().scaledToFit().padding()
                    }
                    Text("**쿠폰이름** \(items.first!.name ?? "")").padding(.leading)
                    HStack{
                        Text("**사용 기한** ")
                        Text(items.first!.dueDate!, style: .date)
                    }.padding(.leading)
    //                Text("\(items.first!.placeCategory!.formatted())")
                    Text("**메모**")
                    .padding(.leading)
                    Text("\(items.first!.memo ?? "메모없음")").foregroundColor(Color(.systemGray4)).padding([.leading, .bottom])
                }.background(RoundedRectangle(cornerRadius: 30).stroke().foregroundColor(.azureColor).shadow(color: .gray, radius: 5))
                    .padding(.horizontal)
            }//.listRowSeparator(.hidden)
                .frame(height: .infinity)
             //   .offset(y: -40)
            HStack{
                Button(action: {
                    items.first!.isUsed.toggle()
                    isCouponView.toggle()
                }){
                    Text(items.first!.isUsed ? "\(Image(systemName: "gobackward")) 복구하기" : "\(Image(systemName: "checkmark.circle")) 사용완료")
                        .foregroundColor(.black)
                        .frame(width: 120)
                            .padding()
                            .background(Color.orangeColor, in: Capsule())
                }
                Button(action: {
                    isCouponView.toggle()
                }){
                    Text("확인")
                        .foregroundColor(.black)
                        .frame(width: 60)
                            .padding()
                            .background(Color(.systemGray4), in: Capsule())
                }
            }
            HStack{
                VStack{
                    Image(systemName: "location.fill")
                        .foregroundColor(.gray)
                    Text("근처매장")
                        .foregroundColor(.gray)
                }
                .padding(.leading)
                VStack{
                    Image(systemName: "sun.min.fill")
                        .foregroundColor(.gray)
                    Text("화면밝기")
                        .foregroundColor(.gray)
                }
                VStack{
                    Image(systemName: "location.fill")
                        .foregroundColor(.gray)
                    Text("공유")
                        .foregroundColor(.gray)
                }
                VStack{
                    Image(systemName: "doc.on.doc")
                        .foregroundColor(.gray)
                    Text("번호복사")
                        .foregroundColor(.gray)
                }
                VStack{
                    Image(systemName: "pencil.and.outline")
                        .foregroundColor(.gray)
                    Text("수정")
                        .foregroundColor(.gray)
                }
                .padding(.trailing)

            }.padding(4).background(RoundedRectangle(cornerRadius: 30).stroke())
//            isCouponView.toggle()
        }.navigationBarHidden(true)
    }
}

struct CouponView_Previews: PreviewProvider {
    static var previews: some View {
        CouponView(isCouponView: .constant(true))
    }
}
