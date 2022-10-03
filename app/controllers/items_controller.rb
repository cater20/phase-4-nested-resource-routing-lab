class ItemsController < ApplicationController
  wrap_parameters format: []

  def index
    items = Item.all
    render json: items, include: :user, status: :not_found
  end

  def show
    item = Item.find_by(id: params[:id])
    render json: item, include: :user, status: :not_found
  end
  
  def create
    item = Item.create(item_params)
    render json: item, status: :created, include: :user
  end

  private

  def item_params
    params.permit(:name, :description, :price, :user_id)
  end
end
