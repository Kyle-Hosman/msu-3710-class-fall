class AddFirstNameAndLastNameToStudents < ActiveRecord::Migration[7.1]
  def change
    # Check if 'first_name' column exists before trying to add it
    unless column_exists?(:students, :first_name)
      add_column :students, :first_name, :string
    end
    
    # Check if 'last_name' column exists before trying to add it
    unless column_exists?(:students, :last_name)
      add_column :students, :last_name, :string
    end

    # Remove the old 'name' column if it exists
    if column_exists?(:students, :name)
      remove_column :students, :name, :string
    end
  end
end