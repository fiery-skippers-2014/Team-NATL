class ChangePic < ActiveRecord::Migration
  def change
    change_column(:surveys, :pic, :text)
  end
end
