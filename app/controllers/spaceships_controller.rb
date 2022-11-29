class SpaceshipsController < ApplicationController
  before_action :set_spaceship, only: %i[show]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  private

  def set_spaceship
    @spaceship = Spaceship.find(params[:id])
  end
end
