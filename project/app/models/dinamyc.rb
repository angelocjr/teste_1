class WebTest::Dinamyc < ApplicationRecord
  has_many :review, class_name: 'WebTest::Review'
end
