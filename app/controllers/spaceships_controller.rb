class SpaceshipsController < ApplicationController
  before_action :find_spaceship, only: %w[show edit update destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @spaceships = policy_scope(Spaceship)
  end

  def show
    authorize @spaceship
    @booking = Booking.new
  end

  def new
    @spaceship = Spaceship.new
    authorize @spaceship
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

  def spaceship_params
    params.require(:spaceship).permit(:name, :description, :max_people, :price)
  end

  def find_spaceship
    @spaceship = Spaceship.find(params[:id])
  end
end
