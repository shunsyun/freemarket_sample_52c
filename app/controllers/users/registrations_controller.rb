class Users::RegistrationsController < Devise::RegistrationsController
  def create
     if params[:user][:password] == "" #sns登録なら
       params[:user][:password] = "Devise.friendly_token.first(6)" #deviseのパスワード自動生成機能を使用
       params[:user][:password_confirmation] = "Devise.friendly_token.first(6)"
       super
       sns = SnsCredential.update(user_id:  @user.id)
     else #email登録なら
       super
     end
   end

  private

  def user_params
    params.require(:user).permit(:family_name,:family_kana_name,:first_name,:first_kana_name,:birthday,:postal_code,:prefecture,:city,:block,:building,:tel,:credit_card,:image,:profile,:nickname,:email)
  end
end
