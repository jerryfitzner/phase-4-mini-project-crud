class SpicesController < ApplicationController

  def index
    spices = Spice.all
    render json: spices
  end

  def update
    spice = get_spice
    spice.update(spice_params)
    render json: spice
  end

  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

  def destroy
    spice = get_spice
    spice.destroy
  end

  private

  def get_spice
    Spice.find(params[:id])
  end

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end
end
