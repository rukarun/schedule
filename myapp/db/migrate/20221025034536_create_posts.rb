class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :start
      t.string :end
      t.string :all_day

      t.timestamps
    end
  end
end
