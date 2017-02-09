class CategoriesController < ApplicationController

  def new
    @category = Category.new()
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(category_params)

    redirect_to @category
  end
  
  private

  def category_params
    params.require(:category).permit(:title)
  end

end