require "googleauth"
require "google/apis/calendar_v3"

class GoogleCalendar
  GOOGLE_CALENDAR_ID = ENV["GOOGLE_CALENDAR_ID"]
  GOOGLE_APPLICATION_CREDENTIALS = ENV["GOOGLE_APPLICATION_CREDENTIALS"]
  SCOPE = "https://www.googleapis.com/auth/calendar"

  attr_reader :calendar

  class << self
    def insert_event(absence)
      instance = GoogleCalendar.new(absence)

      event = Google::Apis::CalendarV3::Event.new({
        summary: "#{absence.user.username}: Holidays",
        description: absence.comments,
        start: {
          date_time: absence.start.strftime("%FT%T%:z")
        },
        end: {
          date_time: absence.end.strftime("%FT%T%:z")
        },
        attendees: [
          {email: absence.user.email},
        ]
      })

      instance.calendar.insert_event(GOOGLE_CALENDAR_ID, event)
    end
  end

  def initialize(absence)
    @calendar = Google::Apis::CalendarV3::CalendarService.new
    # get_application_default forces the use of this environment variable.
    # Set it to the location of your JSON credentials.
    @calendar.authorization = Google::Auth::ServiceAccountCredentials.make_creds(
      scope: SCOPE,
      json_key_io: StringIO.new(GOOGLE_APPLICATION_CREDENTIALS)
    )
  end
end
