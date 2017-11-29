class PatientsController < ApplicationController

  before_action :get_patient, only: [:edit, :update, :activity_logs]

  def index
    @patients = Patient.includes(:activity_logs)
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      flash[:success] = "Patient saved successfully"
      redirect_to action: "index"
    else
      flash[:error] = "There is some problem in saving patient, please try again"
      render 'new'
    end 
  end

  def edit
    
  end

  def update
  if @patient.update_attributes(patient_params)
      flash[:success] = "Patient saved successfully"
      redirect_to action: "index"
    else
      flash[:error] = "There is some problem in saving patient, please try again"
      render 'edit'
    end
  end

  private

  def get_patient
    @patient = Patient.find params[:id]
  rescue => e 
    flash[:error] = "Record not found"

  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :physician_name)
  end

end
