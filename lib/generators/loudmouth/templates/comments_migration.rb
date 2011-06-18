class Create<%= topic_model.camelize %>Comments < ActiveRecord::Migration
  def self.up
    create_table :<%= topic_model.downcase %>_comments do |t|
      t.references :parent
      t.integer :<%= topic_model.downcase.foreign_key %>
      t.integer :author_<%= user_model.downcase.foreign_key %>
      t.text :content
      t.timestamps
    end
    add_index :<%= topic_model.downcase %>_comments, :<%= topic_model.downcase.foreign_key %>
    add_index :<%= topic_model.downcase %>_comments, :author_<%= user_model.downcase.foreign_key %>
    add_index :<%= topic_model.downcase %>_comments, :parent_id
  end

  def self.down
    remove_index :<%= topic_model.downcase %>_comments, :parent_id
    remove_index :<%= topic_model.downcase %>_comments, :author_<%= user_model.downcase.foreign_key %>
    remove_index :<%= topic_model.downcase %>_comments, :<%= topic_model.downcase.foreign_key %>
    drop_table :<%= topic_model.downcase %>_comments
  end
end
