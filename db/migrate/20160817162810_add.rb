class Add < ActiveRecord::Migration[5.0]
  def change
    add_column :invitations, :token, :string, null: false, default: ""
  end
end
