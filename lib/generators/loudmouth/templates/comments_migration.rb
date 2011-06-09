class Create<%= topic_model.camelize %>Comments < ActiveRecord::Migration
  def self.up
    create_table :<%= topic_model.downcase %>_comments do |t|
      t.references :parent
      t.integer :<%= topic_model.downcase %>_id
      t.integer :author_<%= user_model.downcase %>_id
      t.text :content
      t.timestamps
    end
  end

  def self.down
    drop_table :<%= topic_model.downcase %>_comments
  end
end
