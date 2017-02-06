class ChangeColumnMeetingDate < ActiveRecord::Migration[5.0]
  def change
  	remove_column :meetings, :date, :string
  	remove_column :meetings, :time, :string
  	add_column :meetings, :datetime, :timestamp
  end


end
