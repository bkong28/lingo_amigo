class AddFilenameToAnswers < ActiveRecord::Migration
  def change
  	add_column :answers, :filename, :string
  end
end
