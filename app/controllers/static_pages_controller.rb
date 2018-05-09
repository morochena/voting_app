class StaticPagesController < ApplicationController
  def home
    if logged_in?
    @poll = current_user.polls.build
    end
  end

  def about
  end

  def help
  end
end
