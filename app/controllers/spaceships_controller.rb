class SpaceshipsController < ApplicationController
  before_action :find_spaceship, only: %w[show edit update destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    # @spaceships = policy_scope(Spaceship).where(:user_id => current_user.id)
    @bookings = policy_scope(Booking).where(user: current_user)
  end

  def show
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    @spaceship.user = current_user
    @spaceship.save
    authorize @spaceship

    redirect_to spaceship_path(@spaceship)
  end

  def edit
    authorize @spaceship
  end

  def update
    authorize @spaceship
  end

  def destroy
    authorize @spaceship
  end

  private

  def booking_params
    params.require(:booking).permit(:name, :description, :max_people, :price, :start_time, :end_time)
  end
end
