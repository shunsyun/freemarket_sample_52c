class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2, :facebook]
  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_kana_name, presence: true,format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :first_kana_name, presence: true,format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}

  has_many :items
  has_many :sns_credentials, dependent: :destroy
  has_one :wallet

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first

    if snscredential.present? #sns登録のみ完了してるユーザー
      user = User.where(id: snscredential.user_id).first
      unless user.present? #ユーザーが存在しないなら
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email
        )
      end
      sns = snscredential

    else #sns登録 未
      user = User.where(email: auth.info.email).first
      if user.present? #会員登録 済
        sns = SnsCredential.new(
          uid: uid,
          provider: provider,
          user_id: user.id
        )
      else #会員登録 未
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email
        )
        sns = SnsCredential.create(
          uid: uid,
          provider: provider
        ) 
      end
    end
    return { user: user , sns_id: sns.id } # hashでsnsのidを返り値として保持しておく
  end


end
