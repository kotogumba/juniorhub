class AddEducationExpierinceSkillsToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :education, :string
    add_column :profiles, :experience, :string
    add_column :profiles, :skills, :string
  end
end
