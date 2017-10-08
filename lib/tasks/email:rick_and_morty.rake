namespace :email do
  task :rick_and_morty => :environment do
    User.all.each { |u| QuoteMailer.quote_email(u).deliver_now! }
  end
end
