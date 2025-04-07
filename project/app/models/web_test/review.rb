class WebTest::Review < ApplicationRecord
  belongs_to :dynamics, class_name: 'WebTest::Dynamic'
end
