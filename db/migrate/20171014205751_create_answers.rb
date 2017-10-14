class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.references :question, index: true, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
