class AddColumnLastNameToJobResponses < ActiveRecord::Migration[7.0]
  def change
    add_column :job_responses, :last_name, :string
  end
end
