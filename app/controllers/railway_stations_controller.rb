class RailwayStationsController < ApplicationController
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_position, :update_time]
  before_action :find_route, only: [:update_position, :update_time]

  def index
    @railway_stations = RailwayStation.all
  end

  def show
  end

  def new
    @railway_station = RailwayStation.new
  end

  def edit
  end

  def create
    @railway_station = RailwayStation.new(railway_station_params)
    if @railway_station.save
      redirect_to @railway_station, notice: 'Railway station was successfully created.'
    else
      render :new
    end
  end

  def update
    if @railway_station.update(railway_station_params)
      redirect_to @railway_station, notice: 'Railway station was successfully updated.'
    else
      render :edit
    end
  end

  def update_position
    if @railway_station.update_position(@route, params[:station_index])
      redirect_to route_url(@route), notice: 'Station index was successfully updated.'
    else
      redirect_to route_url(@route)
    end
  end

  def update_time
    if @railway_station.update_time(@route, params[:arrive_time], params[:outgo_time])
      redirect_to route_url(@route), notice: 'Station index was successfully updated.'
    else
      redirect_to route_url(@route)
    end
  end

  def destroy
    @railway_station.destroy
    redirect_to railway_stations_url, notice: 'Railway station was successfully destroyed.'
  end

  private
    def find_route
      @route = Route.find(params[:route_id])
    end

    def set_railway_station
      @railway_station = RailwayStation.find(params[:id])
    end

    def railway_station_params
      params.require(:railway_station).permit(:title)
    end
end
