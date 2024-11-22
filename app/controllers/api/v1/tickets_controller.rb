class Api::V1::TicketsController < ApplicationController
  before_action :authenticate_request
  before_action :set_ticket, only: [:update, :show, :destroy]

  def index
    tickets = Ticket.all
    render json: tickets, status: :ok
  end

  def create
    ticket = Ticket.new(ticket_params)
    if ticket.save
      render json: ticket, status: :created
    else
      render json: { error: ticket.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @ticket.update(ticket_params)
      render json: @ticket, status: :ok
    else
      render json: { error: @ticket.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: @ticket, status: :ok
  end

  def destroy
    if @ticket.destroy
      render json: { message: 'Ticket deleted successfully' }, status: :ok
    else
      render json: { error: 'Unable to delete ticket' }, status: :unprocessable_entity
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find_by(id: params[:id])
    unless @ticket
      render json: { error: 'Ticket not found' }, status: :not_found
    end
  end

  def ticket_params
    params.require(:ticket).permit(:client_name)
  end
end
