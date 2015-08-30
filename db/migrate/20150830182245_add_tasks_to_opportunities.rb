class AddTasksToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :tasks, :text
  end
end
