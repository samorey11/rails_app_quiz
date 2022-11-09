class JobsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    @jobs = Job.all 
    render 'jobs/index'
  end

  def change
    @job = Job.new(job_params)

    if @jobs.save
      render 'jobs/create'
    end
  end
end
