class WebTest::Dynamic < ApplicationRecord
  has_many :reviews, class_name: 'WebTest::Review'

  def self.create_dynamic(params)
    self.create!(
      name: params[:name],
      description: params[:description]
    )
  end

  def self.update_dynamic(params, dynamic)
    dynamic.update(
      name: params[:name],
      description: params[:description]
    )
  end

  def self.delete_dynamic(params, dynamic)
    dynamic.destroy
  end
end
