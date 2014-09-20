class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.string :tag

      t.timestamps
    end
  end
end
