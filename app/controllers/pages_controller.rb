class PagesController < ApplicationController
  def my_page
    if !current_user.nil?
      @user = current_user
    else
      redirect_to root_path, notice: "로그인 해주세요."
    end
  end

  def not_found
  end
end
