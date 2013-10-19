class Work < ActiveRecord::Base
  belongs_to :team
  belongs_to :site

  has_and_belongs_to_many :users
end
