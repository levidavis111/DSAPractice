/*
Your company built an in-house calendar tool called HiCal. You want to add a feature to see the times in a day when everyone is available.

To do this, you’ll need to know when any team is having a meeting. In HiCal, a meeting is stored as an instance of a Meeting class with integer properties startTime and endTime. These integers represent the number of 30-minute blocks past 9:00am.
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
    let sortedMeetings = meetings.sorted(by: {$0.startTime < $1.startTime})
    var mergedMeetings = [Meeting]()
    
    mergedMeetings.append(sortedMeetings[0])
    
    for index in 1..<sortedMeetings.count {
        let currentMeeting = sortedMeetings[index]
        let lastMergedMeeting = mergedMeetings.last!
        
        if currentMeeting.startTime <= lastMergedMeeting.endTime {
            lastMergedMeeting.endTime = max(currentMeeting.endTime, lastMergedMeeting.endTime)
            
        } else {
            mergedMeetings.append(currentMeeting)
        }
        
    }
    
    
    return mergedMeetings
}

