class Admin::ArticlesController < Admin::AdminController

  def index
    @articles = Article.all
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

end
