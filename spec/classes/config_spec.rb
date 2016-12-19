require 'spec_helper'
require 'shared_contexts'

describe 'nxlog::config' do
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
          root => 'C:/nxlog',
          extensions => ['one','two']
          }"
    end

    it 'should create the config directory' do
      is_expected.to contain_file("C:/nxlog/conf.d")
        .with({
          "ensure" => "directory",
          "require" => "Class[Nxlog::Install]"
          })
    end

    it 'should create the config file' do
      is_expected.to contain_file("C:/nxlog/conf/nxlog.conf")
        .with({
          "ensure" => "present",
          "require" => "Class[Nxlog::Install]"
          }).with_content(
            /define ROOT C:\/nxlog/,
            /CacheDir %ROOT\data/,
            /Pidfile %ROOT%\data\nxlog.pid/,
            /SpoolDir %ROOT%\data/,
            /LogFile %ROOT%\data\nxlog.log/,
            /include %ROOT%\conf.d\\*.conf/
          )
    end
    it 'should properly include extensions' do
      is_expected.to contain_file("C:/nxlog/conf/nxlog.conf").with_content(
        /Module xm_one/,
        /Module xm_two/
        )
    end
  end
end
