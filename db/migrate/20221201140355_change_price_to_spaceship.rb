class ChangePriceToSpaceship < ActiveRecord::Migration[7.0]
  def change
    change_column :spaceships, :price, :integer
  end
end
