class TopControllerController < ApplicationController
  def index
    @blogs = Blog.all
  end
end
