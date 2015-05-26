class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|

      t.timestamps
      t.string :setting_type
      t.string :name
      t.string :value
    end
  end
end
