require "test_helper"

class ContactMailerTest < ActionMailer::TestCase
  test "submission_email" do
    contact_params = {
      first_name: "John",
      last_name: "Doe",
      email: "john@example.com",
      message: "Test message"
    }

    mail = ContactMailer.submission_email(contact_params)
    assert_equal "Nuovo messaggio di contatto da John Doe", mail.subject
    assert_match "John", mail.body.encoded
    assert_match "Test message", mail.body.encoded
  end
end
