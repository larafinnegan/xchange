class Admin::SkillsController < ApplicationController

  def index
    @skills = Skill.all
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    p "kkkkkk"
    p @skill
    if @skill.save
      flash[:info] = "#{@skill.name} has been successfully created."
      redirect_to admin_skills_path
    else
      render new_admin_skill_path
    end
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
     @skill = Skill.find(params[:id])
    if @skill.update_attributes(skill_params)
      flash[:success] = "Skill updated successfully."
      redirect_to admin_skills_path
    else
      render new_admin_skill_path
    end
  end

    def destroy
    @skill = Skill.find(params[:id]).destroy
    redirect_to admin_skills_path
  end

  private
  def skill_params
      params.require(:skill).permit(:name)
    end
end
