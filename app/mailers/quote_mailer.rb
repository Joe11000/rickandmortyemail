class QuoteMailer < ApplicationMailer
  # default from: 'jgnoonan27@gmail.com'

  def quote_email user
    @user = user
    @quote = Faker::RickAndMorty.quote

    rick_pick_asset_path = Dir['public/assets/rick_pic*jpg'].try(:first)
    attachments['rick_pick.jpg'] = File.read(rick_pick_asset_path)
    # byebug
    mail(to: @user.email, subject: "Rick and Morty Good Morning!")
  end

  # def self.previewing_email

  # end
end
