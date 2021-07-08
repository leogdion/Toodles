//
//  ContentView.swift
//  Toodles
//
//  Created by Leo Dion on 7/7/21.
//

import SwiftUI

struct IceCreamImage : Identifiable {
  let id : String
}
struct ContentView: View {
  @State var selectedIceCreams = Set<String>()
  var images : [IceCreamImage] {
    names.components(separatedBy: .newlines).compactMap{ word in
      let word = word.trimmingCharacters(in: .whitespacesAndNewlines)
      guard word.count > 4 else {
        return nil
      }
      let index = word.index(word.endIndex, offsetBy: -5)
      let result =  word[word.startIndex...index]
      return String(result)
    }.map(
      IceCreamImage.init
    )
  }
    var body: some View {
      ScrollView {
      LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]){
        ForEach(self.images) { iceCream in
          Button {
            if selectedIceCreams.contains(iceCream.id) {
              selectedIceCreams.remove(iceCream.id)
            } else {
              selectedIceCreams.update(with: iceCream.id)
            }
          } label: {
            ZStack{
              RoundedRectangle(cornerRadius: 4.0, style: .circular).foregroundColor(.primary).opacity(selectedIceCreams.contains(iceCream.id) ? 0.1 : 0.2)
              Image(iceCream.id).resizable().scaledToFit().padding(10.0).opacity(selectedIceCreams.contains(iceCream.id) ? 1.0 : 0.8)
            }.padding(4.0)
          }.padding(.horizontal, 4.0)

          
        }
      }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
