class RemoveMinorFromStudents < ActiveRecord::Migration[7.1]
  def change
    remove_column :students, :minor, :string
  end
end
