class CreateSchools < ActiveRecord::Migration[7.0]
  def change
    create_table :schools do |t|
      t.string :school_uniq_id
      t.string :school_name
      t.boolean :approve_by_gov
      t.string :city

      t.timestamps
    end
  end
end
