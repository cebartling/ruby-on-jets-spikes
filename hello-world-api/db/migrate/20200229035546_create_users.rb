class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name, nullable: false
      t.string :last_name, nullable: false
      t.integer :age, nullable: false

      t.timestamps
    end
  end
end
