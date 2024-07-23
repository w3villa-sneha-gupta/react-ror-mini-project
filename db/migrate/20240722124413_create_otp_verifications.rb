class CreateOtpVerifications < ActiveRecord::Migration[7.1]
  def change
    create_table :otp_verifications do |t|
      t.references :user, null: false, foreign_key: true
      t.string :otp_code
      t.datetime :expires_at
      t.boolean :verified

      t.timestamps
    end
  end
end
