class AddInstitutionAndLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location, :string, :default => nil
    add_column :users, :affiliation, :string, :default => nil
  end
end
