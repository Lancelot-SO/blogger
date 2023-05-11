class AddDefaultValue < ActiveRecord::Migration[7.0]
  def change
    change_column_default :posts, :commentscounter, 0
    change_column_default :posts, :likescounter, 0
    change_column_default :users, :postscounter, 0
  end
end
