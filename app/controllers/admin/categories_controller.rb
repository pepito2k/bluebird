class Admin::CategoriesController < Admin::AdminController

  def index
    @categories = Category.paginate(:page => params[:page], :order => "name asc")
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])

    if @category.save
      redirect_to admin_categories_path, notice: "Category added successfully"
    else
      flash[:errors] = @category.errors.full_messages
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(params[:category])
      redirect_to admin_categories_path, notice: "Category updated successfully"
    else
      render :edit
    end
  end

  def destroy
    category = Category.find(params[:id])
    if category.destroy
      flash[:notice] = "Category deleted successfully"
    else
      flash[:errors] = category.errors.full_messages
    end
    redirect_to admin_categories_path
  end

end
