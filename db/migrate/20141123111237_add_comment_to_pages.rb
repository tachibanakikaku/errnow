class AddCommentToPages < ActiveRecord::Migration
  def change
    add_column :pages, :comment, :text
  end
end
