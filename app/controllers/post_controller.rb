class PostController < ApplicationController
  def index 
    @open = Post.all.order(id: :desc).select{|post| post.archive == false}
    @closed = Post.all.order(id: :desc).select{|post| post.archive == true}
  end 

  def indexArchive
    @open = Post.all.order(id: :desc).select{|post| post.archive == false}
    @closed = Post.all.order(id: :desc).select{|post| post.archive == true}
  end

  def archive 
    @post = Post.find_by(id: params[:id])
    @post.archive = (@post.archive) ? false : true
    @post.save 
    redirect_to("/")
  end

  def show 
    @post = Post.find_by(id: params[:id])
  end

  def new 
    @post = Post.new(title: params[:title], content: params[:content], archive: false)
  end

  def create 
    @post = Post.new(title: params[:title], content: params[:content], archive: false)
    if @post.save
      redirect_to("/post/#{@post.id}")
    end
  end

  def edit 
    @post = Post.find_by(id: params[:id])
  end

  def update 
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    if @post.save 
      redirect_to("/post/#{@post.id}")
    end
  end
end
