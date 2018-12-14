class CreateProductTranslations < ActiveRecord::Migration[5.1]
  def self.up
    Product.create_translation_table!({
      :short_description => :string,
      :description => :text,
      :title => :string
    }, {
      :migrate_data => true,
      :remove_source_columns => true
    })
  end

  def self.down
    Product.drop_translation_table! :migrate_data => true
  end
end
