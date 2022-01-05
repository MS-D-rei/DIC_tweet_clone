class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end

  def create
    @post = Post.new(post_params)
    if params[:back]
      render :new
    elsif @post.save
      flash[:success] = 'tweeted successfully'
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_url
    else
      render :edit
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = 'tweet deleted'
    redirect_to root_url
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
