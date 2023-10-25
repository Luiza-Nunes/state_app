class SiteController < ApplicationController
  def index
    @states = []
    State.all.each do |state|
      @states.push(state.name)
    end
  end

  def search
    state = State.find_by(name: params[:state])
    @cities = City.where(state_id: state.id)
    @cities = @cities.where("lower(name) LIKE ?", "%#{params[:city].downcase}%")

    render "site/search"
  end
end
