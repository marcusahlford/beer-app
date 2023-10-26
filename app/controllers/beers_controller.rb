class BeersController < ApplicationController
  def index
    @beers = Beer.all(page: params[:page], name: params[:name])
  end

  def show
    @beer = Beer.find(params[:id])
  rescue PunkApi::NotFoundError
    raise ActionController::RoutingError, 'Not Found'
  end
end
