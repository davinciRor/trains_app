class CarriagesController < ApplicationController
  before_action :find_train, only: [:create, :new]

  def new
    @carriage = @train.carriages.build
  end

  def create
    @carriage = @train.carriages.build(carriage_params)
    if @carriage.save
      redirect_to @train, note: 'Carriage successfuly created!'
    else
      render :new
    end
  end

  private

  def carriage_params
    params.require(:carriage).permit(:top_seats, :kind, :bottom_seats)
  end

  def find_train
    @train = Train.find(params[:train_id])
  end
end
