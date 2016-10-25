require 'spec_helper'
require 'shared_contexts'

describe 'nxlog::service'  do
  context 'On Windows' do
    let :facts do
      {
        :kernel          => 'windows',
        :osfamily        => 'windows',
        :operatingsystem => 'windows',
      }
    end
    it 'the service should be running and start at boot' do
      is_expected.to contain_service('nxlog')
        .with({
          'ensure' => 'running',
          'enable' => 'true'
          })
    end
  at_exit { RSpec::Puppet::Coverage.report! }
  end
end
