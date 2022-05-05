//
//  DebugView.swift
//  NC1
//
//  Created by Hyorim Nam on 2022/05/05.
//

import SwiftUI
import CoreData

struct DebugView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Item.entity(), sortDescriptors: [NSSortDescriptor(key: "dueDate", ascending: true)]) var items: FetchedResults<Item>
    
    var body: some View {
        VStack{
            Text("size of item: '\(items.count)'")
            Button("test"){
                add(dueDate: Date(), barcodeNumber: "dummy-numb", context: viewContext)
                print("test11")
            }
            ForEach(items){i in
                Text(" \(i.dueDate?.description ?? "noname")")
            }

//            ForEach(0..<items.count, id: \.self){i in
//                Text("\(items[i].name)")
//            }
        }
    }
    
    func add(dueDate: Date, barcodeNumber: String, context: NSManagedObjectContext){
        let coupon = Item(context: context)
        coupon.id = UUID()
        coupon.dueDate = dueDate
        coupon.barcodeNumber = barcodeNumber
        
        save(context: context)
    }
    
//    func save(context: NSManagedObjectContext){
//        do{
//            try context.save()
//            print("save1")
//
//        } catch{
//            print("no-save1")
//        }
//    }
    
}

struct DebugView_Previews: PreviewProvider {
    static var previews: some View {
        DebugView()
    }
}
