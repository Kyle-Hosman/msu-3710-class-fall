class RenameNameAndAddLastNameToStudents < ActiveRecord::Migration[7.1]
  def change
    rename_column :students, :name, :first_name
    add_column :students, :last_name, :string
  end
end
