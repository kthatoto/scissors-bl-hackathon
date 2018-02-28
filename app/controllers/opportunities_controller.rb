class OpportunitiesController < ApplicationController

  def search
    from_date = DateTime.now
    to_date   = params[:date].to_i.days.since
    opp_arel = Opportunity.arel_table[:date]
    @opportunities = Opportunity.all
    # @opportunities = Opportunity.where(opp_arel.gteq(from_date).and(opp_arel.lteq(to_date)))
  end
end
