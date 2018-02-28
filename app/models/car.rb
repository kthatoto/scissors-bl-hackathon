class Car < ApplicationRecord

  belongs_to :user

  def name_jp
    name ? name : "名称未取得"
  end

  def maturity_jp
    maturity ? maturity.strftime('%Y-%m-%d') : "満期日未取得"
  end
end
