class AddLanguageIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :language_id, :integer
  end
end
