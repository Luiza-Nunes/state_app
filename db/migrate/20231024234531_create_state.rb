class CreateState < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.string :name
    end
  end
end
