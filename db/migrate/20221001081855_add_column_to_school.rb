class AddColumnToSchool < ActiveRecord::Migration[7.0]
  def change
    add_column :schools, :school_director_id, :integer, foreign_key: true

  end
end
