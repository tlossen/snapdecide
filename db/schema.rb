# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 2) do

  create_table "decision", :force => true do |t|
    t.column "question",   :string,   :limit => 250, :null => false
    t.column "people",     :string,   :limit => 250, :null => false
    t.column "options",    :string,   :limit => 250, :null => false
    t.column "code",       :integer,                 :null => false
    t.column "created_at", :datetime
  end

  create_table "participant", :force => true do |t|
    t.column "decision_id", :integer,                                 :null => false
    t.column "position",    :integer
    t.column "name",        :string,  :limit => 100
    t.column "answers",     :string,  :limit => 100, :default => " "
  end

end