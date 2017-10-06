namespace :email do
  task :rick_and_morty => :environment do
    QuoteMailer.quote_email(User.first).deliver_now!
  end
end
