class CooksController < ApplicationController
  def index
    @cooks = Cook.includes(:user).order('created_at DESC')
  end

  def new
    @cooks = Cook.new
  end
end
