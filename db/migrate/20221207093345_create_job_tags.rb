class CreateJobTags < ActiveRecord::Migration[7.0]
  def change
    create_table :job_tags do |t|
      t.references :job, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
