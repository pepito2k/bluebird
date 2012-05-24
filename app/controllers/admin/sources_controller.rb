class Admin::SourcesController < ApplicationController

  def index
    @sources = Source.all
  end

  def new
    @source = Source.new
  end

  def create
    @source = Source.new(params[:source])
    if @source.save
      redirect_to admin_sources_path, notice: "Source added successfully"
    else
      flash[:errors] = @source.errors.full_messages
    end
    #render :new
  end

  def edit
    @source = Source.find(params[:id])
  end

  def update
    @source = Source.find(params[:id])

    if @source.update_attributes(params[:source])
      redirect_to admin_sources_path, notice: "Source updated successfully"
    end
    #render :edit
  end

  def destroy
    source = Source.find(params[:id])
    if source.destroy
      flash[:notice] = "Source deleted successfully"
    else
      flash[:notice] = source.errors.full_messages
    end
    redirect_to admin_sources_path
  end

end
