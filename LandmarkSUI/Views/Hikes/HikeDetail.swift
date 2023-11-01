/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a hike.
*/

import SwiftUI

struct HikeDetail: View {
    @State var dataToShow = \Hike.Observation.elevation
    
    let hike: Hike

    var selectors = [
        ("Elevation", \Hike.Observation.elevation),
        ("Heart Rate", \Hike.Observation.heartRate),
        ("Pace", \Hike.Observation.pace)
    ]

    var body: some View {
        VStack(spacing: 25) {
            HikeGraph(hike: hike, path: dataToShow)
                .frame(height: 200)
            // ВАРИАНТ с КНОПКАМИ
//            HStack(spacing: 20) {
//                ForEach(selectors, id: \.0) { config in
//                    Button {
//                        dataToShow = config.1
//                    } label: {
//                        Text(config.0)
//                            .font(.system(size: 15))
//                            .foregroundColor(config.1 == dataToShow
//                                ? .gray
//                                : .accentColor)
//                            .animation(nil)
//                    }
//                }
//            }
            // ВАРИАНТ с СЕГМЕНТАМИ
            Picker("Observation", selection: $dataToShow) {
                ForEach(selectors, id: \.0) { selector in
                    Text(selector.0).tag(selector.1)
                        .accentColor(.white)
                }
            }
            .colorMultiply(.blue.opacity(0.5))
            .pickerStyle(.segmented)
            .padding([.leading, .trailing], 20)
        }
    }
}

struct HikeDetail_Previews: PreviewProvider {
    static var previews: some View {
        HikeDetail(hike: ModelData().hikes[0])
    }
}
