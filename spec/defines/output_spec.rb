require 'spec_helper'



describe 'nxlog::output' do

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
        'output_name' => 'logs',
        'output_module' => 'om_tcp',
        'output_host' => '192.168.1.1',
        'output_port' => '514',
        'output_exec' => 'to_syslog_snare();'
      }
    end

    it 'should containt the output config file' do

      is_expected.to contain_file('C:/nxlog/conf.d/logs.conf')
    end

  end
end
