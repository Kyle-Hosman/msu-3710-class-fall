class RemoveStudentsSchoolEmail < ActiveRecord::Migration[7.1]
  def change
    remove_column :students, :school_email, :string if column_exists?(:students, :school_email)
  end
end
