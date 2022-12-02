class MySpaceshipsController < ApplicationController
  def index
    # @spaceships = Spaceship.all.records.user == user
    @spaceships = policy_scope(Spaceship)
    # @spaceships = Spaceship.all
    # @spaceship.user = user
    # @my_spaceships.spaceship = @spaceship
  end

  def confirmed

  end

  def declined
  end

end
