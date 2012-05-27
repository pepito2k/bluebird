class Admin::SourcesController < ApplicationController

  def index
    @sources = Source.all
  end

  def show
    @source = Source.find(params[:id])
  end

  def new
    @source = Source.new
    @categories = Category.all
  end

  def create
    @source = Source.new(params[:source])
    if @source.save
      redirect_to admin_sources_path, notice: "Source added successfully"
    else
      flash[:errors] = @source.errors.full_messages
      render :new
    end
  end

  def edit
    @source = Source.find(params[:id])
    @categories = Category.all
  end

  def update
    @source = Source.find(params[:id])
    @categories = Category.all

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
