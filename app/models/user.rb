class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :orders

  # Validations
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :role, presence: true, inclusion: { in: %w[admin customer], message: "%{value} is not a valid role" }

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= 'customer'
  end

  def admin?
    role == 'admin'
  end
end
