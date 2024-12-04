//
//  Demo.swift
//  Demo
//
//  Created by Jorge Salcedo on 04/12/24.
//

import AppIntents

struct AddTimerIntent: AppIntent {
    static var title = LocalizedStringResource("Start a New Timer")
    
    enum TimeUnit: String, AppEnum {
        case seconds = "Seconds"
        case minutes = "Minutes"
        
        static var typeDisplayRepresentation: TypeDisplayRepresentation {
            "Time Unit"
        }
        
        static var caseDisplayRepresentations: [Self: DisplayRepresentation] {
            [
                .seconds: DisplayRepresentation(title: "Seconds"),
                .minutes: DisplayRepresentation(title: "Minutes")
            ]
        }
    }
    
    @Parameter(
        title: "Duration",
        description: "Specify the time)"
    )
    var duration: Int
    
    func perform() async throws -> some IntentResult {
        if duration > TimerViewModel.shared.getTimer() {
            TimerViewModel.shared.addTimer(seconds: duration)
        }
        
        return .result()
    }
}
