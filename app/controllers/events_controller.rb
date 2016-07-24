class EventsController < ApplicationController
  def index
    @events = Event.all    
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = 'Event has been created successfully'
      redirect_to new_event_ticket_types_path(@event)
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(events_params)
      flash[:success] = 'Event has been updated successfully'
    else
      render 'edit'
    end
  end

  private
  def event_params
    params.require(:event).permit(:name, :extended_html_description, :hero_image_url, :starts_at, :ends_at, :venue_id, :category_id, :user_id)
  end
end
