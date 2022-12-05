class CreateJobResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :job_responses do |t|
      t.references :job, foreign_key: true
      t.references :user, foreign_key: true
      # enum status
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
