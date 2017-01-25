class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.string :date
      t.string :time
      t.string :host
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.text :comment
      t.integer :club_id
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
