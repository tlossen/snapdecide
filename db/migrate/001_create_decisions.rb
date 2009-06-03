class CreateDecisions < ActiveRecord::Migration
  def self.up
    create_table :decision do |t|
      t.column :question, :string, :limit => 250, :null => false
      t.column :people, :string, :limit => 250, :null => false
      t.column :options, :string, :limit => 250, :null => false
      t.column :code, :integer, :null => false
      t.column :created_at, :datetime
    end
  end

  def self.down
    drop_table :decision
  end
end
