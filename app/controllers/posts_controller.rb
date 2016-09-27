class PostsController < ApplicationController
  def index
    @welcome_msg = "Hello World!"
    @posts = PostsController.allposts
  end

  def show
    @posts = PostsController.allposts
    @mypost = nil

    @posts.each do |post|
      number = params[:id].to_i
      if post[:id] == number
        @mypost = post
      end
    end
    if @mypost == nil
      @mypost = {id: params[:id].to_i, title: "Blog post not found!", body: ""}
    end
  end

  def create
    @params = params
    @title = params["title"]
    @author = params["author"]
    @body = params["body"]
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
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
