class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :status_code
      t.text :content

      t.timestamps
    end
  end
end
