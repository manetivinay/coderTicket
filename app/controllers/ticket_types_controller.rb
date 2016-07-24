class TicketTypesController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    @ticket_type = TicketType.new
  end

  def create
    @event = Event.find(params[:event_id])
    @ticket_type = @event.ticket_types.create(ticket_types_params)
    if @ticket_type.save
      flash[:success] = "Event is completed"
      redirect_to(@event)
    else
      render 'new'
    end
  end

  private

  def ticket_types_params
    params.require(:ticket_type).permit(:price, :name, :max_quantity, :event_id)
  end

end
