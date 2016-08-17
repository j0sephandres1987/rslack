class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.references :team, foreign_key: true
      t.boolean :status, default: false
      t.string :email
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
