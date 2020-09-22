class UserMailer < ApplicationMailer
    def comment_email
        @user = params[:user]
        @comment = params[:comment]
        mail(to: @user, subject: "Quickmeet: Someone commented on your post!")
    end
end
