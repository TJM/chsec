Puppet::Type.type(:chsec).provide(:aix) do
  desc 'Provides support for managing /etc/security files in AIX.'
  confine operatingsystem: [:aix]

  commands chsec: '/usr/bin/chsec',
           lssec: '/usr/bin/lssec'

  def create
    chsec('-f', resource[:file], '-s', resource[:stanza], '-a', "#{resource[:attribute]}=#{resource[:value]}")
  rescue Puppet::ExecutionFailure
    raise "chsec for #{resource[:stanza]}:#{resource[:attribute]} of #{resource[:file]} failed."
  else
    notice "Changed #{resource[:file]} #{resource[:stanza]}:#{resource[:attribute]} to #{resource[:value]}"
  end

  def destroy
    # Not sure if we would ever really be here.
    notice "No provision for removing #{resource[:attribute]}"
  end

  def exists?
    command = lssec('-f', resource[:file], '-s', resource[:stanza], '-a', resource[:attribute])
    return command[%r{="?(.+?)"?$}, 1] == resource[:value]
  rescue Puppet::ExecutionFailure
    return false
  end
end
