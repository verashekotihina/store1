class Product < ApplicationRecord
  include Notifications

  has_one_attached :featured_image
  has_rich_text :description

  validates :name, presence: true
  validates :inventory_count, numericality: { greater_than_or_equal_to: 0 }
    private

  def back_in_stock?
    inventory_count_previously_was == 0 && inventory_count > 0
  end
end
