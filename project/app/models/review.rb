class WebTest::Review < ApplicationRecord
  belongs_to :dinamyc, class_name: 'WebTest::Dinamyc'

end
