class SettingsController < ApplicationController
  
  def index
    @settings = Setting.all
  end
  
  def new
    @setting = Setting.new
  end
  
  def create
    setting = Setting.create(setting_params)
    redirect_to settings_path
  end
  
  def destroy
    setting = Setting.delete params[:id]
    redirect_to :back
  end
  
  private
  
  def setting_params
    params.required(:setting).permit(:name, :setting_type, :value, :env)
  end
  
end
