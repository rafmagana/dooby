module Dooby
  module DatesHelper
    def tomorrow
      TOMORROW_TAG[1..-1]
    end
    
    def tomorrows_date
      Chronic.parse(tomorrow).strftime(DATE_FORMAT)
    end
    
    def todays_date
      Time.now.strftime(DATE_FORMAT)
    end
    
    def todays_date_tag
      "{#{todays_date}}"
    end
    
    def today_tag
      "#today"
    end
  end
end