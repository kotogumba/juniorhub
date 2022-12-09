class AddCompanyNameToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :comany_name, :string
  end
end
