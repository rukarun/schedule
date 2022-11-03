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
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:name, :start, :end, :all_day, :introduction))
      flash[:notice] = "ユーザーIDが「#{@post.id}」の情報を更新しました"
      redirect_to :posts
    else
      render "edit"
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :posts
  end
end

