class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.string :access_key
      t.string :secret_access_key

      t.timestamps
    end
  end
end
