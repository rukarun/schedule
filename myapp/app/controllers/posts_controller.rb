class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
 
  def new
    @post = Post.new
  end
 
  def create
    @post = Post.new(params.require(:post).permit(:name, :start, :end, :all_day, :introduction))
    if @post.save
      flash[:notice] = "ユーザーを新規登録しました"
      redirect_to :posts
    else
      render "new"
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
end
