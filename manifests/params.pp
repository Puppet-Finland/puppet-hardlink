#
# == Class: hardlink::params
#
# Defines some variables based on the operating system
#
class hardlink::params {

    case $::osfamily {
        /(RedHat|Debian|FreeBSD)/: {
            # These operating systems should work just fine            
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }
}
