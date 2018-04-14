class BookingMailer < ApplicationMailer
  def confirm(booking)
    @booking = booking  # Instance variable => available in view
    mail(
      :subject => booking.lesson.listing.name + 'booking',
      :to  => 'hello@localfitt.com',
      :from => 'hello@localfitt.com',
      :track_opens => 'true')
  end
  def confirm(booking)
    @booking = booking  # Instance variable => available in view
    mail(
      :subject => 'Your booking',
      :to  => @booking.user.email,
      :from => 'hello@localfitt.com',
      :track_opens => 'true')
  end
end
