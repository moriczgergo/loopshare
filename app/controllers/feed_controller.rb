class FeedController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.where(author: current_user.username).order("created_at DESC").limit(10);
  end

  def post
    @post = Post.new({ author: current_user.username, content: params[:post][:content] });

    if @post.valid?
      @post.save()
      @notice = "Post published."
    else
      @alert = "Post was invalid:<br>" + @post.errors.full_messages.join("<br>")
    end

    index()
    render "index"
  end
end
