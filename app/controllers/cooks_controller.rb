class CooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_cook, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @cooks = Cook.includes(:user).order('created_at DESC')
  end

  def new
    @cook = Cook.new
  end

  def create
    @cook = Cook.new(cook_params)
    if @cook.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @review = Review.new
    @reviews = @cook.reviews.includes(:user)
  end

  def edit
  end

  def update
    if @cook.update(cook_params)
      redirect_to cook_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @cook.destroy
  end

  private

  def cook_params
    params.require(:cook).permit(:cook_name, :recipe, :material, :country_id, :serving_id, :image).merge(user_id: current_user.id)
  end

  def set_cook
    @cook = Cook.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index if current_user.id != @cook.user_id
  end
end
