class TicketsController < ApplicationController
  before_action :find_train, only: [:new, :create]

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = @train.tickets.build(ticket_params)
    @ticket.user = User.first
    if @ticket.save
      redirect_to tickets_path, notice: 'Ticket was successfully created.'
    else
      redirect_to new_train_ticket_path(@train)
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:user_first_name, :user_last_name, :user_middle_name, :user_passport)
  end

  def find_train
    @train = Train.find(params[:train_id])
  end
end