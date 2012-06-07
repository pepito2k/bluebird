class Admin::ArticlesController < Admin::AdminController

  def index
    if params['category']
      @category = Category.find(params['category'])
      @articles = @category.articles.paginate(:page => params[:page] )
    else
      @articles = Article.paginate(:page => params[:page])
    end
    @categories = Category.active.order("name asc")
  end

  def destroy
    article = Article.find(params[:id])
    if article.destroy
      flash[:notice] = "Article deleted successfully"
    else
      flash[:notice] = article.errors.full_messages
    end
    redirect_to admin_articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update_attributes(params[:article])
      redirect_to admin_articles_path, notice: "Article updated successfully"
    else
      render :edit
    end
  end

end
