class CreateNewsPosts < ActiveRecord::Migration
  def change
    create_table :news_posts do |t|
      t.references :user, index: true
      t.string :title
      t.string :author
      t.text :body

      t.timestamps
    end
  end
end
