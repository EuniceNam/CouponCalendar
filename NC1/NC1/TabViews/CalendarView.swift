//
//  Calendar.swift
//  CouponCalendar
//
//  Created by Hyorim Nam on 2022/05/02.
//

import SwiftUI
//import Foundation

struct CalendarView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>

    @State var currDate: Date = Date()
//    var now = Date()
//    var dayNow = Calendar.current.component(.day, from: Date())
//    @State var currentMonth: Int = Calendar.current.component(.month, from: Date())
//    @State var currentDate = Date()
//    let calendar = Calendar.current

//    func datesOfMonth()->[DayInMonth]{
//        let calendar = Calendar.current
//        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
//            return []
//        }
//        var days = currentMonth.daysInMonth().compactMap{ da -> DayInMonth in
//            let day = calendar.component(.day, from: da)
//            return DayInMonth(day: day, date: da)
//        }
//
//        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
//
//        for _ in 0..<firstWeekday-1{
//            days.insert(DayInMonth(day: -1, date: Date()), at: 0)
//        }
//
//        return days
//    }
//
//    func getCurrentMont()->Date{
//        let calendar = Calendar.current
//
//        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to:Date()) else{
//            return Date()
//        }
//        return currentMonth
//    }

    var body: some View {
        VStack(alignment: .leading){
            
            //CalendarComponent
//            Group{
//                Text(verbatim: "\(calendar.component(.year, from: now))년").font(.subFont).padding(.horizontal)
//                HStack{
//                    Button(action: {currentMonth -= 1}, label: {Image(systemName: "chevron.left")})
//                        .padding()
//                    Spacer()
//                    Text(verbatim: "\(currentMonth)월").font(.mainFont).padding()
//                    Spacer()
//                    Button(action: {currentMonth += 1}, label: {Image(systemName: "chevron.right")})
//                        .padding()
//                }
//                HStack{
//                    //a week
//                    let week = ["일", "월", "화", "수", "목", "금", "토"]
//                    ForEach(week, id:\.self){ day in
//                        Text(day).font(.subFont)
//                            .frame(maxWidth: .infinity)
//                    }
//                }
                
//                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: .infinity) {
//                    ForEach(datesOfMonth()){ date in
//                            DateView(date: date)
//
//                    }
//                }
//                .padding(.horizontal)
                
                
//            }
//            .onChange(of: currentMonth){ newVal in
//                currrentDate = getCurrentMonth()
//            }
            
            //UI용
            //MARK: 교체 예정
            DatePicker(
                "Start Date",
                selection: $currDate,
                displayedComponents: [.date]
            ).datePickerStyle(.graphical)
            
            Divider().padding()
            LazyVStack{
                //ForEach
                Text("Dates")
                HStack{
                    VStack{
                        Text(Image(systemName: "checkmark.circle.fill")).foregroundColor(.greenColor)
                        + Text(" 사용함")
                        Text("Photos")
                    }.padding()
                    Spacer()
                    VStack{
                        Text(Image(systemName: "stopwatch.fill")).foregroundColor(.redAccentColor) //or clock
                        + Text(" 사용 필요")
                        Text("Photos")
                    }.padding()
                    Spacer()
                    
                }
            }
        }
//        .onChange(of: currentDate){ newVal in
//
//        }
    }
}

//@ViewBuilder

@ViewBuilder
func DateView(date: DayInMonth) -> some View{
    VStack{
        
        Text("\(date.day)").font(.mainFont)
        //if coupon exists for the date
        //let color =
        //if coupon(date.date) != 0{
        //  color =
        //}
        Text(Image(systemName: "circle.fill"))// + Text("\()")
    }
}

struct DayInMonth: Identifiable{
    var id = UUID()
    var day: Int
    var date: Date
}

extension Date{
    func daysInMonth()->[Date]{
        let calendar = Calendar.current //calendar setting이래
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        var range = calendar.range(of: .day, in: .month, for: startDate)!
        range.removeLast()
        
        return range.compactMap{ day -> Date in
            return calendar.date(byAdding: .day, value: (day == 1) ? 0 : day, to: startDate)!
        }
    }
}

struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(currDate: Date())
    }
}
