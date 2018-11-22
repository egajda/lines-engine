class AddTeaserToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :lines_articles, :teaser, :text
  end
end
