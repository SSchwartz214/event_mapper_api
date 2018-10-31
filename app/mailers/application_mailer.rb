class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@eventmapper.io'
  layout 'mailer'
end
