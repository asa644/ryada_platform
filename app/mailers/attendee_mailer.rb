class AttendeeMailer < ApplicationMailer
  def inform(attendee)
    @attendee = attendee  # Instance variable => available in view
    mail(
      :subject => 'Hello from LocalFitt',
      :to  => 'hello@localfitt.com',
      :from => 'hello@localfitt.com',
      :track_opens => 'true')
  end
end
