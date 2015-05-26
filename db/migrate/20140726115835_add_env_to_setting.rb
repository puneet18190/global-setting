class AddEnvToSetting < ActiveRecord::Migration
  def up
    add_column :settings, :env, :string
  end
  
  def down
    remove_column :settings, :env
  end
end
