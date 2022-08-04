class FollowersController < ApplicationController
  before_action :logged_in_user, :find_user, only: :index

  def index
    @title = t "users.followers.followers"
    @pagy, @users = pagy @user.followers, items: Settings.micropost.item
    render "users/show_follow"
  end
end
