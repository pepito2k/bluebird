class Admin::ArticlesController < Admin::AdminController

  def index
    @articles = Article.paginate(:page => params[:page])
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
