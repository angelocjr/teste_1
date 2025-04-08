class WebTest::Review < ApplicationRecord
  belongs_to :dynamic, class_name: 'WebTest::Dynamic'

  def self.create_review(dynamic, params)
    self.create!(
      comment: params[:comment],
      note: params[:note],
      dynamic_id: dynamic.id
    )
  end

  def self.delete_review(review)
    review.destroy
  end
end
