require 'spec_helper'
require 'shared_contexts'

describe 'nxlog::service'  do
  it 'the service should be running and start at boot' do
    is_expected.to contain_service('nxlog')
      .with({
        'ensure' => 'running',
        'enable' => 'true'
        })
  end
end