class SpaceshipsController < ApplicationController
  before_action :find_spaceship, only: %i[show]

  def index
    @spaceships = Spaceship.all
  end

  def new
    @spaceship = Spaceship.new
  end

  def create
    @spaceship = Spaceship.new(flat_params)
    if @spaceship.save
      redirect_to spaceships_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show

  end

  private

  def find_spaceship
    @spaceship = Spaceship.find(params[:id])
  end

  def spaceship_params
    params.require(:spaceship).permit(:name, :description, :max_people, :price)
  end
end
