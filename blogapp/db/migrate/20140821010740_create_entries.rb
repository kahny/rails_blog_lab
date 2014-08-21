class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
    	t.references :post
    	t.references :tag
      t.timestamps
    end
  end
end
