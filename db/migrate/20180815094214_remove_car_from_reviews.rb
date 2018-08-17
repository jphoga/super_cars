class RemoveCarFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_reference :reviews, :car, foreign_key: true
  end
end
