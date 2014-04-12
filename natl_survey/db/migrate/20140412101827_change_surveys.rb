class ChangeSurveys < ActiveRecord::Migration
  def change
    change_table :surveys do |t|
      t.string :pic
    end
  end
end
