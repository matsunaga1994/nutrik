class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    validates :family_name
    validates :first_name
    validates :family_name_kana
    validates :first_name_kana
    validates :birthday
  end


  with_options format:{ with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}\z/i } do
    validates :password
  end

  with_options format:{ with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :family_name
    validates :first_name
  end

  with_options format:{ with: /\A[ァ-ヶ一]+\z/ } do
    validates :family_name_kana
    validates :first_name_kana
  end
end
