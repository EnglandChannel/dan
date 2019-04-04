class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :line_items
  before_destroy :check_if_has_line_item
  
  private
  
  def check_if_has_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'This product has a LineItem')
      return false
    end
  end

  default_scope -> { includes(:user).order(created_at: :desc) }

  validates :title, presence: true, length: { minimum: 5, maximum: 255 }
  validates :info, presence: true, length: { minimum: 20, maximum: 5000 }
  validates :category_id, presence: true

  mount_uploader :image, ImageUploader

  scope :by_category, -> (branch, category_name) do 
    joins(:category).where(categories: {name: category_name, branch: branch}) 
  end

  scope :by_branch, -> (branch) do
    joins(:category).where(categories: {branch: branch}) 
  end

  scope :search, -> (search) do
    where("title ILIKE lower(?)", "%#{search}%")
  end

end
