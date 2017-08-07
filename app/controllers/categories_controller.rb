class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def show
    category = Category.find(params[:id])
    @listings = category.listings
  end
end
