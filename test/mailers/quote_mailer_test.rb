require 'test_helper'

class QuoteMailerTest < ActionMailer::TestCase
  test "quote_email" do
    mail = QuoteMailer.quote_email
    assert_equal "Quote email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
