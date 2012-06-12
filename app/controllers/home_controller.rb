class HomeController < ApplicationController

  def index
    @categories = Category.active
  end

  def read
    @category = Category.find_by_slug(params[:category_slug])
    articles = @category.articles.active.order("id desc").limit(15)
    @pages = articles.each_slice(5).to_a
  end

end
