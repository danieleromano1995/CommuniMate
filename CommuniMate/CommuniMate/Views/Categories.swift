//
//  Categories.swift
//  CommuniMate
//
//  Created by Aldo Di Giovanni on 18/11/21.
//
import SwiftUI

struct Categories: View {
    
    @State private var category_selected = false
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
   
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach (0..<category_images.count, id: \.self) {i in
                        Button (action: {
                            category_selected = category_selected ? false : true
                        }, label: {
                            ZStack {
                                category_images[i]
                                if category_selected {
                                    Image("mask2").opacity(0.6)
                                    //Image("mask") //brighter maybe too much
                                }
                            }
                        })
                    
                        
                    }
                }
            }.navigationTitle("Choose your categories")
        
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        Categories()
    }
}
