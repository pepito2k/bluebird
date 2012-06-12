class Admin::SourcesController < Admin::AdminController

  before_filter :find_source, :only => [:show, :edit, :update]

  def index
    if params['category']
      @category = Category.find(params['category'])
      @sources = @category.sources.paginate(:page => params[:page])
    else
      @sources = Source.paginate(:page => params[:page])
    end
    @categories = Category.active.order("name asc")
  end

  def show
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
    @categories = Category.active
  end

  def update
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

  private
  def find_source
    @source = Source.find(params[:id])
  end
end
