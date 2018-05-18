class StaticPagesController < ApplicationController
  def home
    if logged_in?
    @poll = current_user.polls.build
    redirect_to user_url(current_user)
    end
  end

  def about
  end

  def help
  end
end
