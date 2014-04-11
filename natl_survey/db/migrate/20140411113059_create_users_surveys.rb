class CreateUsersSurveys < ActiveRecord::Migration
  def change
    create_table :users_surveys do |t|
      t.belongs_to :user
      t.belongs_to :survey
      t.timestamps
    end
  end
end
