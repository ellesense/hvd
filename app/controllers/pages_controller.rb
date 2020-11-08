class PagesController < ApplicationController
  def my_page
    if !current_user.nil?
      @user = current_user
    else
      redirect_to root_path, notice: "로그인 해주세요."
    end
  end

  def not_found
    redirect_to root_path, notice: "해당 페이지는 존재하지 않거나 찾을 수 없습니다."
  end
end
