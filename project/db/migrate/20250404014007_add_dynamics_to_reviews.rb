class AddDynamicsToReviews < ActiveRecord::Migration[7.1]
  def change
    add_reference :reviews, :dynamic, null: false, foreign_key: true
  end
end
