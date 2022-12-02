class BookingsController < ApplicationController
  # enum status: { pending: 0, confirmed: 1, declined: 2 }
  def index
    # @spaceships = policy_scope(Spaceship).where(:user_id => current_user.id)
    @bookings = policy_scope(Booking).where(user: current_user)
  end

  def show
  end

  def create
    @spaceship = Spaceship.find(params[:spaceship_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.spaceship = @spaceship
    # @booking.status = status.pending
    @booking.status = "pending"
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render :create, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:name, :description, :max_people, :price, :start_time, :end_time )
  end
end
