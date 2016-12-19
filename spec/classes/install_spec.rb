require 'spec_helper'
require 'shared_contexts'

describe 'nxlog::install' do
  on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end
        it 'should install the package' do
          is_expected.to contain_package("nxlog")
              .with({
                "ensure"   => "present",
                "provider" => "chocolatey",
                })
        end
      end
  end
end
