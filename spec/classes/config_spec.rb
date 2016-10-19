require 'spec_helper'
require 'shared_contexts'

describe 'nxlog::config' do 
  
  let(:params) do 
    {
      :root => "C:/nxlog"
    }
  end
  
  it 'should create the config directory' do
    is_expected.to contain_file("C:/nxlog/conf.d")
      .with({
        "ensure" => "directory",
        "require" => "Class[Nxlog::Install]"
        })
  end
  # TODO: extend to test content param
  it 'should create the config directory' do
    is_expected.to contain_file("C:/nxlog/conf/nxlog.conf")
      .with({
        "ensure" => "present",
        "require" => "Class[Nxlog::Install]"
        })
  end

end