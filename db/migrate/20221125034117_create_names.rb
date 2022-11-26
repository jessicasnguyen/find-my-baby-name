class CreateNames < ActiveRecord::Migration[7.0]
  def change
    create_table :names do |t|
      t.string :name
      t.text :meaning
      t.string :gender

      t.timestamps
    end
  end
end
