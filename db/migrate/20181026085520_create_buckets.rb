class CreateBuckets < ActiveRecord::Migration[5.2]
  def change
    create_table :buckets do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
