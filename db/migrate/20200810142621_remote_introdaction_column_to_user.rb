class RemoteIntrodactionColumnToUser < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :introdaction, :introduction
  end
end
