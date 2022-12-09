class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :jobs, :comany_name, :company_name
  end
end
