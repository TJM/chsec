require 'puppet'
require 'puppet/type/chsec'
require 'spec_helper'
describe Puppet::Type.type(:chsec) do
  subject { Puppet::Type.type(:chsec).new(name: 'maxage') }

  it 'accepts ensure' do
    subject[:ensure] = :present
    expect { subject[:ensure].to eq(:present) }
  end

  it 'requires a value' do
    subject[:value] = 'testing'
    expect { subject[:value].to eq('testing') }
  end

  it 'does not accept a missing value' do
    expect { subject[:value] = nil }.to raise_error(Puppet::Error, %r{value})
  end

  it 'requires a file' do
    subject[:file] = '/etc/security/limits'
    expect { subject[:file].to eq('/etc/security/limits') }
  end

  it 'does not accept a missing file' do
    expect { subject[:file] = nil }.to raise_error(Puppet::Error, %r{file})
  end

  it 'requires a stanza' do
    subject[:stanza] = 'default'
    expect { subject[:stanza].to eq('default') }
  end

  it 'does not accept a missing stanza' do
    expect { subject[:stanza] = nil }.to raise_error(Puppet::Error, %r{stanza})
  end
end
