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
