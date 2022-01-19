class Contact < MailForm::Base
  attribute :name
  attribute :email
  attribute :message

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    { 
      subject: "My contact form",
      to: '<thejadeonwot@gmail.com>',
      from: %("#{name}" <#{email}">)
    }
  end
end