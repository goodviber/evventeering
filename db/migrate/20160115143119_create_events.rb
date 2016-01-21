class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :uri_id
      t.date :start_time
      t.date :end_time
      t.string :keywords
      t.string :venue
      t.string :title
      t.string :image_url

      t.timestamps
    end
  end
end
