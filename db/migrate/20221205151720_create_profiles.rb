class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.string :linkedin_url
      t.string :github_url
      t.string :personal_website_url
      t.string :resume_url
      t.string :other_url
      t.text :bio
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
