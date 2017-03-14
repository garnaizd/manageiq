class ShowbackRate < ApplicationRecord
  validates :rating,                :presence => true
  validates :concept,               :presence => true
  validates :rating_type_money,     :on       => :create

  belongs_to :tariff

  def rating_type_money
    errors.add(:rating, "Rating must be instance of Money") unless :rating.instance_of? Money
  end
end
