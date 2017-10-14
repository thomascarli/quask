class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.string :state

      t.timestamps
    end
  end
end
