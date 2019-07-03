class UsersController < ApplicationController
before_action :set_search

def index
end

def new
end

def show
end

def number
end

def address
end

def credit
end

def done
end

def identification
end

def mypage
  @user = User.find(current_user.id)
end

def mypage_profile
  @user = User.find(current_user.id)
end

def delete
end

def mypage_listing
  @item = Item.where(params[:id])
end

private

def set_search
  @q = Item.search(params[:q])
end


end
