require 'spec_helper'
describe 'nxlog' do

  context 'with defaults for all parameters' do
    it { should contain_class('nxlog') }
  end
end
