class UserMailer < ApplicationMailer
  default from: 'admin@clintgeek.com'

  def like_email
    @game = params[:game]
    mail(to: 'clintgeek@gmail.com', subject: 'New liked game!')
  end
end
