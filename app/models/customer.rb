class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # :database_authenticatable（パスワードの正確性を検証）
  # :registerable（ユーザ登録や編集、削除）
  # :recoverable（パスワードをリセット）
  # :rememberable（ログイン情報を保存）
  # :validatable（emailのフォーマットなどのバリデーション）        
  
  has_many :myitems, dependent: :destroy
  has_many :items, through: :myitems
  has_many :favorites, dependent: :destroy
  
  
  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  
  def full_name
    self.lastname + self.firstname
  end
  
  
end
