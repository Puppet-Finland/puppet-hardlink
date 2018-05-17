# hardlink

A Puppet module for managing hardlinks.

# Module usage

Example of adding a hardlink:

    ::hardlink::link { '/hardlink':
      source => '/source_file',
    }
