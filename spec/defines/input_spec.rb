require 'spec_helper'
require 'shared_contexts'


describe 'nxlog::input' do

  context 'On Windows' do
    let :facts do
      {
        :kernel          => 'windows',
        :osfamily        => 'windows',
        :operatingsystem => 'windows',
      }
    end

    let(:pre_condition) do
      "class {'::nxlog':
        root => 'C:/nxlog'
        }"
    end
    let(:title) {'test'}
    let(:params)do
      {
        'input_name' => 'eventlogs',
        'input_module' => 'im_msvistalog',
        'query' => '*'
      }
    end

    it 'should containt the input config file' do

      is_expected.to contain_file('C:/nxlog/conf.d/eventlogs.conf')
    end
    
  end
end
