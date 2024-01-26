//
//  WeatherAppWidgetLiveActivity.swift
//  WeatherAppWidget
//
//  Created by Edvin Mujanovic on 2024-01-26.
//

import ActivityKit
import WidgetKit
import SwiftUI

//BEHÖVS EJ JUST NU
/*
struct WeatherAppWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct WeatherAppWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: WeatherAppWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension WeatherAppWidgetAttributes {
    fileprivate static var preview: WeatherAppWidgetAttributes {
        WeatherAppWidgetAttributes(name: "World")
    }
}

extension WeatherAppWidgetAttributes.ContentState {
    fileprivate static var smiley: WeatherAppWidgetAttributes.ContentState {
        WeatherAppWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: WeatherAppWidgetAttributes.ContentState {
         WeatherAppWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: WeatherAppWidgetAttributes.preview) {
   WeatherAppWidgetLiveActivity()
} contentStates: {
    WeatherAppWidgetAttributes.ContentState.smiley
    WeatherAppWidgetAttributes.ContentState.starEyes
}
*/
