class ApplicationMailer < ActionMailer::Base
  default from: "Kangaroo App <codereview.pr@gmail.com>"
  layout 'mailer'
end
