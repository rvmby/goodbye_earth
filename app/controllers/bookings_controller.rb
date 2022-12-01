class BookingsController < ApplicationController
  def index
    #@spaceships = policy_scope(Spaceship).where(:user_id => current_user.id)
    @bookings = policy_scope(Booking).where(:user_id => current_user.id)
  end

  def show
  end


  def create
    @spaceship = Spaceship.find(params[:spaceship_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.spaceship = @spaceship
    if @booking.save
      redirect_to spaceships_path
    else
      render :create, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:name, :description, :max_people, :price)
  end


end
