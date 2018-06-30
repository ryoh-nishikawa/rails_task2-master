class TopsControllerController < ApplicationController
  def top
    @blog = Blog.all
  end
end
