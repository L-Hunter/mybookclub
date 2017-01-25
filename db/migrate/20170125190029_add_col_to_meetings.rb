class AddColToMeetings < ActiveRecord::Migration[5.0]
  def change
    add_column :meetings, :rsvp, :text, array: true, default: []
  end
end
