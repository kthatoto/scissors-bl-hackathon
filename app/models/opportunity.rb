class Opportunity < ApplicationRecord

  belongs_to :user

  enum time_zone: {all_day: 0, before_noon: 1, noon: 2, evening: 3, night: 4}

  def time_zone_jp
    return "一日" if time_zone == 'all_day'
    return "午前中" if time_zone == 'before_noon'
    return "お昼" if time_zone == 'noon'
    return "夕方" if time_zone == 'evening'
    return "夜" if time_zone == 'night'
  end

  def sale_jp
    is_sold ? "予約済み" : "空き"
  end
end
