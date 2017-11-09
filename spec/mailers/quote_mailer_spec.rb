require "rails_helper"

RSpec.describe QuoteMailer, type: :mailer do
  context '.email_quote' do
    let(:user) { User.create name: 'Joe', email: 'j@aol.com' }
    let(:mail) { QuoteMailer.quote_email user }
    let(:expected_subject) { "Rick and Morty: Good Morning #{user.name}!"}

    it 'renders the headers' do
      expect(mail.subject).to eq expected_subject
      expect(mail.to).to contain_exactly(user.email)
    end

    it 'has 1 attachment' do
      expect(mail.attachments.size).to eq 1
      expect(mail.attachments.first.filename).to eq "rick_pick.jpg"
    end

    it 'renders the body' do
      mail_body_encoded = mail.body.encoded
      expect(mail_body_encoded).to match 'Daily Rick and Morty Email'
    end
  end
end
