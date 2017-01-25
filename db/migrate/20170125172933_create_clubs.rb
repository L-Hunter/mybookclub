class CreateClubs < ActiveRecord::Migration[5.0]
  def change
    create_table :clubs do |t|
      t.string :club_name
      t.text :description
      t.integer :user_id
      t.boolean :is_public
      t.string :club_pass

      t.timestamps
    end
  end
end
