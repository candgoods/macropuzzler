class FoodsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    #@foods = Food.all
    #@foods = Food.paginate(:page => params[:page], :per_page => 10)
    @q = Food.ransack(params[:q])
    @foods = @q.result.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @food = Food.new
  end

  def create
    current_user.foods.create(food_params)
    redirect_to root_path
  end

  def about

  end

  def findfits

  end


  private

  def food_params
    params.require(:food).permit(:name, :restaurant, :fat, :carbs, :protein, :calories)
  end
end
