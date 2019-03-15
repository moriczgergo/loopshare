class FeedController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.where(author: current_user.username).limit(10);
  end

  def post
    @post = Post.new({ author: current_user.username, content: params[:content] });
  end
end
