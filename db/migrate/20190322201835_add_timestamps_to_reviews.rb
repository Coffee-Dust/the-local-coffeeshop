class AddTimestampsToReviews < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :reviews, default: DateTime.now
    change_column_default :reviews, :created_at, nil
    change_column_default :reviews, :updated_at, nil
  end
end
