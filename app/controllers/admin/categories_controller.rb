class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV["USER_ID"], password: ENV["PASSWORD"], except: [:index]
  
  def index
    @category = Category.order(:name).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: "Category created!"
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end