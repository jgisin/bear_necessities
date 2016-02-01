class CreateBears < ActiveRecord::Migration
  def change
    create_table :bears do |t|
      t.string :name, :null => false
      t.string :description, :null =>false
      t.timestamps null: false
    end
  end
end
