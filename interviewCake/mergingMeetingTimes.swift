/*
Your company built an in-house calendar tool called HiCal. You want to add a feature to see the times in a day when everyone is available.

To do this, you’ll need to know when any team is having a meeting. In HiCal, a meeting is stored as an instance of a Meeting class with integer properties startTime and endTime. These integers represent the number of 30-minute blocks past 9:00am.

Write a function mergeRanges() that takes an array of multiple meeting time ranges and returns an array of condensed ranges.

For example, given:

  [
    Meeting(startTime: 0,  endTime: 1),
    Meeting(startTime: 3,  endTime: 5),
    Meeting(startTime: 4,  endTime: 8),
    Meeting(startTime: 10, endTime: 12),
    Meeting(startTime: 9,  endTime: 10)
]

Swift
your function would return:

  [
    Meeting(startTime: 0, endTime: 1),
    Meeting(startTime: 3, endTime: 8),
    Meeting(startTime: 9, endTime: 12)
]

Swift
Do not assume the meetings are in order. The meeting times are coming from multiple teams.
*/

class Meeting: CustomStringConvertible, Equatable {

    var startTime: Int
    var endTime: Int

    init(startTime: Int, endTime: Int) {

        // number of 30 min blocks past 9:00 am
        self.startTime = startTime
        self.endTime = endTime
    }

    var description: String {
        return "(\(startTime), \(endTime))"
    }

    static func == (lhs: Meeting, rhs: Meeting) -> Bool {
        return lhs.startTime == rhs.startTime && lhs.endTime == rhs.endTime
    }
}


func mergeRanges(in meetings: [Meeting]) -> [Meeting] {
    let sorted = meetings.sorted {$0.startTime < $1.startTime}
    var mergedMeetings = [sorted[0]]
    
    for index in 1..<sorted.count {
        let meeting = sorted[index]
        let lastMeeting = mergedMeetings[mergedMeetings.count - 1]
        
        if meeting.startTime <= lastMeeting.endTime {
            lastMeeting.endTime = max(meeting.endTime, lastMeeting.endTime)
        } else {
            mergedMeetings.append(meeting)
        }
    }
   
   return mergedMeetings
}
