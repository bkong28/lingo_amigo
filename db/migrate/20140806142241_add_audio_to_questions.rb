class AddAudioToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :audio, :string
  end
end
