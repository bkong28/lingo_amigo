class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :phrase
      t.string :language

      t.timestamps
    end
  end
end
