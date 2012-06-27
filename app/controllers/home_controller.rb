class HomeController < ApplicationController

  def index
    @categories = Category.active.select("distinct(categories.id), categories.*").joins(:articles)
  end

  def read
    @category = Category.find_by_slug(params[:category_slug])
    articles = @category.articles.active.order("id desc").limit(15)
    articles_ids = articles.map { |i| i['id'] }
    sorted_articles = @category.articles.where("articles.id in (#{articles_ids.join(',')})").active.order("weight desc")
    @pages = sorted_articles.each_slice(5).to_a
  end

end
