class User < ApplicationRecord
  has_many :posts
  has_many :comments
  validates :nickname, length: { minimum: 2, maximum: 10 }, presence: true, uniqueness: true
  validate :reserved_words

  def reserved_words
      if (/admin/i.match(self.nickname) || /manager/i.match(self.nickname) || /주인/.match(self.nickname) || /관리자/.match(self.nickname) || /매니저/.match(self.nickname) || /오너/.match(self.nickname) || /administrator/i.match(self.nickname) || /exec/i.match(self.nickname) || /ceo/i.match(self.nickname) || /operator/i.match(self.nickname))
        errors.add(:nickname, "사용이 금지된 닉네임입니다.")
      end
  end


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  validates_confirmation_of :password
end
