class CreateEventPosts < ActiveRecord::Migration
  def change
    create_table :event_posts do |t|
      t.references :user, index: true
      t.string :title
      t.string :author
      t.string :event_name
      t.datetime :event_date_time
      t.text :event_description

      t.timestamps
    end
  end
end
