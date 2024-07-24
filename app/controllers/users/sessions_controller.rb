# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  #before_action :configure_sign_in_params, only: [:create, :show]

  # GET /resource/sign_in
  #def new
    #super
  #end

  # POST /resource/sign_in
  #def create
    #super
  #end

  def show
    @event_attendees = EventAttendee.attendees.current_user
    @events = current_user.events
    @user = User.find(params[:id])
  end

  # DELETE /resource/sign_out
  #def destroy
    #super
  #end

  # protected

  #If you have extra params to permit, append them to the sanitizer.
  #def configure_sign_in_params
     #devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  #end
end