class CreateSchoolDirectors < ActiveRecord::Migration[7.0]
  def change
    create_table :school_directors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.bigint :mobile_no
      t.text :location
      t.text :about

      t.timestamps
    end
  end
end
