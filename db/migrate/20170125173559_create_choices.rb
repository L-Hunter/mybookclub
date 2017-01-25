class CreateChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :choices do |t|
      t.integer :book_id
      t.integer :meeting_id
      t.boolean :selected
      t.string :category

      t.timestamps
    end
  end
end
