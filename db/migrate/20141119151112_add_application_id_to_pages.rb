class AddApplicationIdToPages < ActiveRecord::Migration
  def change
    add_column :pages, :application_id, :integer
  end
end
