class AddResponseToAnswers < ActiveRecord::Migration
  def change
  	rename_column :answers, :description, :response
  end
end
