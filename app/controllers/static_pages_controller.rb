class StaticPagesController < ApplicationController
  def home
    if logged_in?
    @poll = current_user.polls.build
    @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def about
  end

  def help
  end
end
