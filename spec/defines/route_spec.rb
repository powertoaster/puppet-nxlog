require 'spec_helper'



describe 'nxlog::route' do

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
        'route_name' => 'route',
        'route_path' => 'test => out',
      }
    end

    it 'should containt the output config file' do

      is_expected.to contain_file('C:/nxlog/conf.d/route.conf')
    end

  end
end
