class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_train, only: [:new, :create]
  before_action :find_ticket, only: [:show, :delete]

  def index
    @tickets = current_user.tickets
  end

  def new
    @ticket = Ticket.new
    @start_station = RailwayStation.find(params[:start_station])
    @end_station = RailwayStation.find(params[:end_station])
  end

  def create
    @ticket = @train.tickets.build(ticket_params)
    @ticket.user = current_user
    if @ticket.save
      redirect_to tickets_path, notice: 'Ticket was successfully created.'
    else
      redirect_to new_train_ticket_path(@train)
    end
  end

  def show
    @ticket = current_user.tickets.find(params[:id])
  end

  def destroy
    @ticket = current_user.tickets.find(params[:id])
    @ticket.destroy
    redirect_to tickets_url, 'Ticket was successfuly deleted'
  end

  private

  def ticket_params
    params.require(:ticket).permit(:user_first_name, :user_last_name, :user_middle_name, :user_passport, :base_station, :end_station)
  end

  def find_train
    @train = Train.find(params[:train_id])
  end

  def find_ticket
    @ticket = current_user.tickets.find(params[:id])
  end
end