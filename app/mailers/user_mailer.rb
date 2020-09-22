class UserMailer < ApplicationMailer
    def comment_email
        @comment = params[:comment]
        mail(to: 'dkim.steve@gmail.com', subject: "Quickmeet: Someone commented on your post!")
    end
end
