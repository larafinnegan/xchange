class SearchesController < ApplicationController
  def new
    @search = Search.new
    @skills = Skill.all
    @interests = Interest.all
    @opportunities = Opportunity.all
  end

 def create
    @search = Search.new(search_params)
    if @search.save
      redirect_to edit_search_path(@search)
    else
      render :new
    end
  end

  def edit
    @skills = Skill.all
    @interests = Interest.all
    @search = Search.find(params[:id])
  end

  def update
    @search = Search.find(params[:id])
    if @search.update_attributes(search_params)
      redirect_to edit_search_path(@search)
    else
      render :edit
    end
  end

  def search_params
      params.require(:search).permit(:name, :postcode, :last_name, :under_18,
                                   :distance, :expert, :group, :skill_ids => [], :interest_ids => [])
    end
end
