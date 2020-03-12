require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "like_email" do
    it "should send an email" do
      @game = Game.new(
        name: 'One',
        year: '1901',
        manufacturer: 'Pub1',
        description: 'Desc1',
      )
      
      expect { UserMailer.with(game: @game).like_email.deliver_now } .to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
