# Preview all emails at http://localhost:3000/rails/mailers/quote_mailer
class QuoteMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/quote_mailer/quote_email
  def quote_email
    QuoteMailer.quote_email
  end

end
