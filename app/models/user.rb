class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :password,        format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze }
  validates :nickname,        presence: true
  validates :first_name,      presence: true
  validates :last_name,       presence: true
  validates :kana_first_name, presence: true, format: { with: /\A[ｧ-ﾝﾞﾟァ-ヶー－]+\z/ }
  validates :kana_last_name,  presence: true, format: { with: /\A[ｧ-ﾝﾞﾟァ-ヶー－]+\z/ }
  validates :birthday,        presence: true
end
