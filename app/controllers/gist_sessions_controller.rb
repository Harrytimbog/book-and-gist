class GistSessionsController < ApplicationController
  def index
    @gist_sessions = GistSession.all
  end

  def show
    @booking = Booking.new
    @gist_session = GistSession.find(params[:id])
  end

  def new
    @gist_session = GistSession.new
  end

  def create
    @gist_session = GistSession.new(gist_session_params)
    @gist_session.host = current_user
    if @gist_session.save
      flash[:notice] = "Gist Session successfully added!"
      redirect_to user_path(current_user)
    else
      render :new
    end

  end

  def destroy
    @gist_session = GistSession.find(params[:id])
    @gist_session.destroy
    flash[:alert] = "Gist Session deleted"
    redirect_to user_path(current_user)
  end

  private

  def gist_session_params
    params.require(:gist_session).permit(:gist, :title, :description, :address, :start_time,
                                        :finish_time, :capacity, :host_id)
  end
end
