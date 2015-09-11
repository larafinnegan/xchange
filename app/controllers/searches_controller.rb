class SearchesController < ApplicationController
  def new
    @search = Search.new
    @skills = Skill.all
    @interests = Interest.all
  end

  def create
    @search = current_user.searches.build(search_params)
    if @search.save
      redirect_to @search
    else
      render 'new'
    end
  end

  def edit
  end

  def index
  end

  def show
    @search = Search.find(params[:id])
  end

  def search_params
      params.require(:search).permit(:name, :postcode, :last_name, :under_18,
                                   :expert, :group, :skill_ids => [], :interest_ids => [])
    end
end
