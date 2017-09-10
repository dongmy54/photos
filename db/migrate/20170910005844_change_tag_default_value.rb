class ChangeTagDefaultValue < ActiveRecord::Migration[5.0]
  def change
    change_column_default :photos, :tag, "untag"
  end
end
