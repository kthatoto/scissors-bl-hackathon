class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def meeting?
    !!(name && gender && region)
  end

  def gender_jp
    return "男性" if gender == 0
    return "女性" if gender == 1
    return "性別未設定"
  end
  def region_jp
    return region if region
    return "地域未設定"
  end
end
