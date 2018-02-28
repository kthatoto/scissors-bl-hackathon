class OpportunitiesController < ApplicationController

  def search
    from_date = DateTime.now
    to_date   = params[:date].to_i.days.since
    opp_arel = Opportunity.arel_table[:date]
    @opportunities = Opportunity.all
    # @opportunities = Opportunity.where(opp_arel.gteq(from_date).and(opp_arel.lteq(to_date)))
  end

  def update
    opp = Opportunity.find(params[:id])
    opp.update(is_sold: true)
    flash[:notice] = "予約が完了しました。ドライブを楽しんでください！"
    redirect_to :root
  end
end
