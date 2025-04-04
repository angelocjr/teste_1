class CreateDynamics < ActiveRecord::Migration[7.1]
  def change
    create_table :dynamics do |t|
      t.text :nome
      t.text :description

      t.timestamps
    end
  end
end
