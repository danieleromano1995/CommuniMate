//
//  Categories.swift
//  CommuniMate
//
//  Created by Aldo Di Giovanni on 18/11/21.
//
import SwiftUI

struct Categories: View {
    @EnvironmentObject var connector : Connector
    @State var categoriesSelection : [String] = []
    @State private var category_selected = false
    @State var ready = false
    @State var selected : [Bool] = []
    @State var opacity : [Double] = [0,
                                  0,
                                  0,
                                  0,
                                  0,
                                  0,
                                  0,
                                  0,
                                  0,
                                  0,
                                  0,
                                  0
    ]
    @State var black : [Image] = [Image("mask2"),
                                  Image("mask2"),
                                  Image("mask2"),
                                  Image("mask2"),
                                  Image("mask2"),
                                  Image("mask2"),
                                  Image("mask2"),
                                  Image("mask2"),
                                  Image("mask2"),
                                  Image("mask2"),
                                  Image("mask2"),
                                  Image("mask2")
    ]
    @Binding var isHost : Bool
    let categories = CategoriesLibrary()
    var category_images = [Image("pets"),
                           Image("business"),
                           Image("healthcare"),
                           Image("hobbies"),
                           Image("LifeExperience"),
                           Image("music"),
                           Image("games"),
                           Image("literature_lang"),
                           Image("sport"),
                           Image("food"),
                           Image("tech"),
                           Image("movies_series")]
    let columns : [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        ZStack{
            NavigationLink(destination: Loading(isHost: $isHost), isActive: $ready){
                EmptyView()
            }.onAppear(perform: {
                for _ in category_images {
                    selected.append(false)
                }
            })
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach (0..<category_images.count, id: \.self) {i in
                        Button (action: {
                            selected[i] = selected[i] ? false : true
                            let category = categories.keys
                            if selected[i]{
                                categoriesSelection.append(category[i])
                                opacity[i] = 0.8
                            }else{
                                if categoriesSelection.contains(category[i]){
                                    opacity[i] = 0
                                   let removable =  categoriesSelection.firstIndex(of: category[i])
                                    categoriesSelection.remove(at: removable!)
                                }
                            }
                            print(category_images.count)
                            print(selected.count)
                            print(i)
                        }, label: {
                            ZStack {
                                category_images[i]
                                black[i].opacity(opacity[i])
                                    //Image("mask") //brighter maybe too much
                            }
                        })
                    
                        
                    }
                }
            }.navigationTitle("Choose your categories")
            .toolbar {
                ToolbarItem{
                    Button("Done"){
                        print(categoriesSelection)
                        connector.sendCategories(Categories: categoriesSelection)
                        connector.sendDone()
                        connector.readyCounter += 1
                        ready = true
                }
            }
    }
    }
}

}
