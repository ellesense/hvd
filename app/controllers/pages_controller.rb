class PagesController < ApplicationController
  def my_page
    @user = current_user
  end
end
