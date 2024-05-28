class EventsController < ApplicationController



  def create
    
    @event = @user.create_event(event_params)

    # @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    elsehtm
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @events = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:date)
  end

end
