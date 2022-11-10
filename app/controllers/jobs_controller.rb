class JobsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    @jobs = Job.all 
    render 'jobs/index'
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      render 'jobs/create'
    end
  end

  private

  def job_params
    params.require(:job).permit(
      :url,
      :employer_name,
      :employer_description,
      :job_title,
      :job_description,
      :year_of_experience,
      :education_requirement,
      :industry,
      :base_salary,
      :employment_type_id
    )
  end
end
