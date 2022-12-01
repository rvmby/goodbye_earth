class BookingsController < ApplicationController
  def index
  end

  def show
  end


  def create
    @spaceship = Spaceship.find(params[:spaceship_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.spaceship = @spaceship
    @booking.save
    redirect_to spaceship_path()
  end

  private

  def booking_params
    params.require(:booking).permit(:name, :description, :max_people, :price)
  end


end
