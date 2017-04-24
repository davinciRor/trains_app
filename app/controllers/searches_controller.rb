class SearchesController < ApplicationController
  def show
    @stations = RailwayStation.all
  end

  def search
    @routes = Route.searched_routes(params[:start_station], params[:end_station])
  end
end
