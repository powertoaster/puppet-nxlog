require 'spec_helper'
require 'shared_contexts'

describe 'nxlog::install' do
    it 'should install the package' do
      is_expected.to contain_package("nxlog")
          .with({
            "ensure" => "present",
            "provider" => "chocolatey",
            })
    end
at_exit { RSpec::Puppet::Coverage.report! }      
end
