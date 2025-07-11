class AddToColumnTeachers < ActiveRecord::Migration[7.0]
  def change
    add_column :teachers, :school_id, :integer,foreign_key: true
  end
end
