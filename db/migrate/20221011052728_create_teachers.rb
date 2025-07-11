class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :email
      t.string :uniq_id
      t.integer :experience
      t.integer :mobile_no
      t.string :about

      t.timestamps
    end
  end
end
