class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :index] 

  def new
    @event = Event.new
  end

  def create
    
    @event = current_user.events.build(event_params)

    #@post = current_user.posts.build(post_params)

    # @post = Post.new(post_params)

    if @event.save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show 
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:date, :location)
  end

end
