class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string, :default => nil
  end
end
