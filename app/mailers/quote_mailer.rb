class QuoteMailer < ApplicationMailer
  default from: 'jgnoonan27@gmail.com'

  def quote_email user
    @user = user
    email_with_name = %("#{@user.name}" <#{@user.email}>)
    # byebug
    @quote = Faker::RickAndMorty.quote
    # attachments.inline['rick_and_morty.jpg'] = File.read('rick_and_morty.jpg')
    mail(to: @user.email, subject: "Hey #{@user.name}")
    #  do |format|
    #   format.html { render 'another_template'}
    #   format.text { render plain: 'Tender Text'}
    # end
  end
end

# User.all.each { |u| QuoteMailer.quote_email(u).deliver_now! }
# * * * * * /bin/bash -l -c "cd /Users/joe/Dropbox/coding/coding/ruby/rails/wip/rails5/email && bundle exec bin/rails runner -e development 'User.all.each { |u| QuoteMailer.quote_email(u).deliver_now! }'"
