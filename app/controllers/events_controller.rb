class EventsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    
    @event = @user.create_event(event_params)

    # @post = Post.new(post_params)

    if @event.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @events = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:date, :location)
  end

end
