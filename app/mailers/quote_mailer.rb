class QuoteMailer < ApplicationMailer
  # default from: 'jgnoonan27@gmail.com'

  require 'nokogiri'
  require 'open-uri'

  def quote_email user
    @user = user
    @quote = Faker::RickAndMorty.quote

    google_search_url = "https://www.google.com/search?q=rick+and+morty+pictures&source=lnms&tbm=isch&sa=X&ved=0ahUKEwiviZ7L6_jWAhWCxIMKHRMYAdcQ_AUICigB&biw=720&bih=775"
    @random_google_image_url = Nokogiri::HTML(open(google_search_url)).css('#center_col img').to_a.sample['src']
    @character = Faker::RickAndMorty.character

    rick_pick_asset_path = Dir['public/assets/rick_pic*jpg'].try(:first)
    attachments['rick_pick.jpg'] = File.read(rick_pick_asset_path)

    mail(to: @user.email, subject: "Rick and Morty: Good Morning #{@user.name}!")
  end
end
