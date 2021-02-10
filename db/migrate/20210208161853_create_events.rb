class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :theme
      t.string :event_representative
      t.datetime :start_time
      t.datetime :end_time
      t.text :link
      t.boolean :is_expired
      t.boolean :is_available
      t.boolean :is_favorite
      t.text :description
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
