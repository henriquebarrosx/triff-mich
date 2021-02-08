class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :event_representative
      t.datetime :start_time
      t.datetime :end_time
      t.text :theme
      t.text :link
      t.boolean :is_available, default: false
      t.boolean :is_favorite, default: false
      t.text :description
      t.boolean :is_expired, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
