require 'spec_helper'
require 'shared_contexts'

describe 'nxlog::install' do
  context 'On Windows' do
    let :facts do
      {
        :kernel          => 'windows',
        :osfamily        => 'windows',
        :operatingsystem => 'windows',
      }
    end
    it 'should install the package' do
      is_expected.to contain_package("nxlog")
          .with({
            "ensure" => "present",
            "provider" => "chocolatey",
            })
    end
  end
  at_exit { RSpec::Puppet::Coverage.report! }
end
