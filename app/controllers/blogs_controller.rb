class BlogsController < ApplicationController
  before_action :set_blog,only:[:show,:edit,:update,:destroy]
  before_action :current_user,only:[:show,:edit,:update,:destroy]
  before_action :login_check, only: [:new, :edit, :update, :destroy]


  def index
    @blog = Blog.all
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path,notice:"ブログを作成しました！"
    else
      render 'new'
    end
    @blog = Blog.new(blogs_params)
    @blog.user_id = current_user.id
  end

  def show
    @blog = Blog.find(params[:id])
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path,notice:"ブログを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path,notice:"ブログを削除しました！"
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  private
  def blog_params
    params.require(:blog).permit(:title,:content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def login_check
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    end
  end
end
