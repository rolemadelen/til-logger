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

  def tag 
    # should i separate open and closed issues? I should... 
    # why would you want to see closed issues...hmm
    # for now lets show all 
    @posts = Post.all.order(id: :desc).select{ |post| (post.tags and post.tags.include? params[:tag])}
  end 

  def show 
    @post = Post.find_by(id: params[:id])
    if @post.tags
      @tags = @post.tags.split(' ')
    else 
      @tags = []
    end
  end

  def new 
    @post = Post.new(title: params[:title], content: params[:content], tags: params[:tags], archive: false)
  end

  def create 
    @post = Post.new(title: params[:title], content: params[:content], tags: params[:tags], archive: false)
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
    @post.tags = params[:tags]
    @post.content = params[:content]
    if @post.save 
      redirect_to("/post/#{@post.id}")
    end
  end
end
