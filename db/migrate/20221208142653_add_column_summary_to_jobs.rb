class AddColumnSummaryToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :summary, :string
  end
end
