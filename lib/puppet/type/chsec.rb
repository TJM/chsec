Puppet::Type.newtype(:chsec) do
  @doc = 'Manage entries in /etc/security files'

  ensurable

  newparam(:name) do
    desc 'The name of the attribute.'
    isnamevar
  end

  newparam(:attribute) do
    desc "The the attribute that we're setting."
    validate do |value|
      unless value
        raise ArgumentError, 'Must include an attribute.'
      end
    end
  end

  newparam(:value) do
    desc 'The value the attribute should be set to.'
    validate do |value|
      unless value
        raise ArgumentError, 'Must include a value.'
      end
    end
  end

  newparam(:file) do
    desc 'The file the attribute lives in.'
    validate do |value|
      unless value
        raise ArgumentError, 'Must include path to the file.'
      end
    end
  end

  newparam(:stanza) do
    desc 'The stanza the attribute lives under.'
    validate do |value|
      unless value
        raise ArgumentError, 'Must include the stanza.'
      end
    end
  end
end
