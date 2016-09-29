class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @mypost = Post.find(params[:id].to_i)
    # @posts = PostsController.allposts
    # @mypost = nil
    #
    # @posts.each do |post|
    #   number = params[:id].to_i
    #   if post[:id] == number
    #     @mypost = post
    #   end
    # end
    # if @mypost == nil
    #   @mypost = {id: params[:id].to_i, title: "Blog post not found!", body: ""}
    # end
  end

  def create
    @params = params

    # @mypost = Post.new({title: params[:post][:title], author: params[:post][:author], body: params[:post][:body]})

    @mypost = Post.new
    @mypost.title = params[:post][:title]
    @mypost.author = params[:post][:author]
    @mypost.body = params[:post][:body]


    @mypost.save
  end

  def new
    @mypost = Post.new
  end

  def edit
    self.show
  end

  def update
    self.show

    @mypost[:title] = params["title"]
    @mypost[:author] = params["author"]
    @mypost[:body] = params["body"]

  end

  def destroy
    num = params[:id].to_i
    Post.find(num).destroy
  end

  def self.allposts
    [
      {id: 1, title: "First Blog Post", author: "Carmen", body: "Warrior Ducks"},
      {id: 2, title: "Second Blog Post", author: "Carmen", body: "I can do this!"},
      {id: 3, title: "Third Blog Post", author: "Carmen", body: "I am a warrior!"}
    ]
  end

  private
  def user_params
    params.require(:post).permit(:title, :author, :body)
  end


end
