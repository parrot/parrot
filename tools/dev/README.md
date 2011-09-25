# Parrot Developer Tools

This directory is intended to hold programs, templates and configuration files
found useful by Parrot developers other than those:

 * invoked by the default 'make' target ('make all')
 * invoked by 'make install'

They will sometimes require additional dependencies to fully function, such as
CPAN modules or third-party programs, like valgrind.

Below is a list of Parrot Developer Tools and a short description of what they do:

## dedeprecator.nqp

This utility will scan your codebase to detect deprecated code and warn you about it.
For example, to find all deprecations in your PIR code:

    dedeprecator.nqp myproject/*.pir

It uses api.yaml by default, but can read alternate YAML configuration files:

    dedeprecator.nqp --apiyaml foo.yaml myproject/*.pir

## show_deprecated.nqp

This utility nicely prints out all deprecations in api.yaml.

## show_experimental.nqp

This utility nicely prints out all experimental stuff in api.yaml.

## resolve_deprecated.nqp

Resolves deprecated features list in api.yaml by querying Trac.

