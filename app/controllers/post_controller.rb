class PostController < ApplicationController
  def index 
    @posts = Post.all.order(id: :desc)
  end 

  def show 
    @post = Post.find_by(id: params[:id])
  end

  def new 
    @post = Post.new(title: params[:title], content: params[:content])
  end

  def create 
    @post = Post.new(title: params[:title], content: params[:content])
    if @post.save
      redirect_to("/post/#{@post.id}")
    end
  end
end
