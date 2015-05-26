class Setting < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name, scope: :env
  
  # Heavy weight method to get and set a configuration variable.
  def self.method_missing(method, *args)
      method_name = method.to_s
      super(method, *args)
    rescue NoMethodError
      #set a value for a variable
      if method_name =~ /=$/
        var_name = method_name.gsub('=', '')
        value = args.first
        setting = Setting.new(name: var_name, value: value, setting_type: value.class.name, env: Rails.env)
        setting.save
      #retrieve a value
      else
        setting = Setting.find_by_name_and_env!(method_name, Rails.env)
        if setting.present?
          setting.value
        end
      end
    end
  
  
  def value
    case self[:setting_type].titleize
      when "String"
        self[:value]
      when "Fixnum"
        self[:value].to_i
      when "Integer"
        self[:value].to_i
      when "Float"
        self[:value].to_f
      when "TrueClass"
        true
      when "Boolean"
        self[:value].present? ? true : false
      when "FalseClass"
        false
    end
  end
  
end
