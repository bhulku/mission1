class CreateSecretCodes < ActiveRecord::Migration
  def change
    create_table :secret_codes do |t|
      t.integer :user_id
      t.string :token

      t.timestamps
    end
  end
end
