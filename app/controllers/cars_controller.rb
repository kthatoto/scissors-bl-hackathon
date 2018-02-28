class CarsController < ApplicationController

  def new
    current_user
    @car = Car.new
  end

  def create
    uri = URI.parse("http://hackathon2018-02-dot-performanceresearch-1.appspot.com/Customer")

    req = Net::HTTP::Get.new(uri.path + "?CarMngNo=#{params[:plate_number]}")
    req.add_field("x-api-key", ENV["X_API_KEY"])
    res = Net::HTTP.start(uri.host, uri.port) {|http|
      http.request(req)
    }

    if res.class == Net::HTTPOK
      body = JSON.parse(res.body)
      user_name = body["Name"]
      current_user.update(
        name: body["Name"],
        gender: body["Sex"] == "男" ? 0 : 1
      )
      maturity_date = body["InspectMaturityDate"].to_s
      maturity = nil
      if maturity_date.length == 8
        maturity = DateTime.new(
          maturity_date.slice(0, 4).to_i,
          maturity_date.slice(4, 2).to_i,
          maturity_date.slice(6, 2).to_i,
        )
      end
      if current_user.car
        current_user.car.update(name: body["ModelName"], maturity: maturity)
      else
        Car.create(
          user_id: current_user.id,
          name: body["ModelName"],
          maturity: maturity
        )
      end
    else
      flash[:alert] = "自動車が見つかりませんでした。"
    end

    redirect_to :tutor
  end
end
