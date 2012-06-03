class Admin::SourcesController < Admin::AdminController

  def index
    if params['category']
      @category = Category.find(params['category'])
      @sources = @category.sources.paginate(:page => params[:page])
    else
      @sources = Source.paginate(:page => params[:page])
    end
    @categories = Category.active
  end

  def show
    @source = Source.find(params[:id])
  end

  def new
    @source = Source.new
    @categories = Category.active
  end

  def create
    @source = Source.new(params[:source])
    @categories = Category.active
    if @source.save
      redirect_to admin_sources_path, notice: "Source added successfully"
    else
      flash[:errors] = @source.errors.full_messages
      render :new
    end
  end

  def edit
    @source = Source.find(params[:id])
    @categories = Category.active
  end

  def update
    @source = Source.find(params[:id])
    @categories = Category.active

    if @source.update_attributes(params[:source])
      redirect_to admin_sources_path, notice: "Source updated successfully"
    else
      flash[:errors] = @source.errors.full_messages
      render :edit
    end
  end

  def destroy
    source = Source.find(params[:id])
    if source.destroy
      flash[:notice] = "Source deleted successfully"
    else
      flash[:errors] = source.errors.full_messages
    end
    redirect_to admin_sources_path
  end
end
