class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  generates_uuid :id
end
