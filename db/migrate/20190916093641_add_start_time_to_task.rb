class AddStartTimeToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :start_date, :date
  end
end
