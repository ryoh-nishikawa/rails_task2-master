class TopsControllerController < ApplicationController
  def index
    @blogs = Blog.all
  end
end
