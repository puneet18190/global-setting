require 'spec_helper'

describe Setting do

  let(:setting) { FactoryGirl.create(:setting) }

  it "has a valid factory" do
    setting.should be_valid
  end

  it "should store data type correctly" do
    new_setting = FactoryGirl.create(:setting, setting_type: "boolean", value: "true")
    new_setting.setting_type.should eq "boolean"
  end

  it "should return boolean value" do
    new_setting = FactoryGirl.create(:setting, setting_type: "boolean", value: "true")
    new_setting.value.should be true
    new_setting.value.should eq true
  end

  it "should return string value" do
    new_setting = FactoryGirl.create(:setting, setting_type: "string", value: "123")
    new_setting.value.should eq "123"
  end
  
  it "should return integer value" do
    new_setting = FactoryGirl.create(:setting, setting_type: "integer", value: "1234")
    new_setting.value.should eq 1234
  end
  
  it "should return float value" do
    new_setting = FactoryGirl.create(:setting, setting_type: "float", value: "12.234")
    new_setting.value.should eq 12.234
  end

  it "should setup value on class level" do
    Setting.test = 12
    Setting.test.should eq 12
    Setting.find_by_name("test").delete
  end

end