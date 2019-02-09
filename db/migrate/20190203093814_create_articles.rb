class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :isbn
      t.string :title
      t.string :author
      t.string :publisher_name
      t.string :itemcaption
      t.string :selesdate
      t.string :image_url
      t.string :item_url
      t.string :summary

      t.timestamps
    end
  end
end
