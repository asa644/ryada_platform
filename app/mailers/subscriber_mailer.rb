class SubscriberMailer < ApplicationMailer
  def welcome(subscriber)
    @subscriber = subscriber  # Instance variable => available in view
    mail(
      :subject => 'Hello from LocalFitt',
      :to  => @subscriber.email,
      :from => 'hello@localfitt.com',
      :track_opens => 'true')
  end
end
