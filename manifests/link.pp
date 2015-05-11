#
# == Define: hardlink::link
#
# Create a hardlink from $source to $title (target).
#
# == Parameters
#
# [*ensure*]
#   The state of the hardlink. Valid values 'present' (default) and 'absent'.
# [*source*]
#   The source file for the hardlink.
# [*title*]
#   While not strictly a parameter, the resource $title is used as the target of 
#   the hardlink. This allows creating several hardlinks from one $source if the 
#   $title is an array.
#
define hardlink::link
(
    $source,
    $ensure = 'present'
)
{
    include ::hardlink::params

    $target = $title

    if $ensure == 'present' {
        exec { "hardlink-from-${source}-to-${target}":
            path    => [ '/bin' ],
            command => "cp -l ${source} ${target}",
            creates => $target,
        }
    } elsif $ensure == 'absent' {
        file { $target:
            ensure => absent,
        }
    }
}
