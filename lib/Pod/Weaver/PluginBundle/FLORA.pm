use strict;
use warnings;

package Pod::Weaver::PluginBundle::FLORA;
BEGIN {
  $Pod::Weaver::PluginBundle::FLORA::AUTHORITY = 'cpan:FLORA';
}
BEGIN {
  $Pod::Weaver::PluginBundle::FLORA::VERSION = '0.02';
}
# ABSTRACT: Document your modules like FLORA does

use Pod::Weaver::Config::Assembler;

sub _exp { Pod::Weaver::Config::Assembler->expand_package($_[0]) }

use namespace::clean;


sub mvp_bundle_config {
    return (
        [ '@FLORA/CorePrep',  _exp('@CorePrep'),    {} ],
        [ '@FLORA/Name',      _exp('Name'),         {} ],
        [ '@FLORA/prelude',   _exp('Region'),       { region_name => 'prelude' } ],

        [ 'SYNOPSIS',         _exp('Generic'),      {} ],
        [ 'DESCRIPTION',      _exp('Generic'),      {} ],
        [ 'OVERVIEW',         _exp('Generic'),      {} ],

        [ 'ATTRIBUTES',       _exp('Collect'),      { command => 'attr'   } ],
        [ 'METHODS',          _exp('Collect'),      { command => 'method' } ],
        [ 'FUNCTIONS',        _exp('Collect'),      { command => 'func'   } ],
        [ 'TYPES',            _exp('Collect'),      { command => 'type'   } ],

        [ '@FLORA/Leftovers', _exp('Leftovers'),    {} ],

        [ '@FLORA/postlude',  _exp('Region'),       { region_name => 'postlude' } ],

        [ '@FLORA/Authors',   _exp('Authors'),      {} ],
        [ '@FLORA/Legal',     _exp('Legal'),        {} ],

        [ '@FLORA/List',      _exp('-Transformer'), { transformer => 'List' } ],
    );
}

1;

__END__
=pod

=head1 NAME

Pod::Weaver::PluginBundle::FLORA - Document your modules like FLORA does

=head1 SYNOPSIS

In weaver.ini:

  [@FLORA]

or in dist.ini:

  [PodWeaver]
  config_plugin = @FLORA

=head1 DESCRIPTION

This is the L<Pod::Weaver> config I use for building my
documentation. I use it via L<Dist::Zilla::PluginBundle::FLORA>.

=head1 OVERVIEW

This plugin bundle is equivalent to the following weaver.ini file:

  [@CorePrep]

  [Name]

  [Region / prelude]

  [Generic / SYNOPSIS]
  [Generic / DESCRIPTION]
  [Generic / OVERVIEW]

  [Collect / ATTRIBUTES]
  command = attr

  [Collect / METHODS]
  command = method

  [Collect / FUNCTIONS]
  command = func

  [Leftovers]

  [Region / postlude]

  [Authors]
  [Legal]

  [-Transformer]
  transformer = List

=for Pod::Coverage mvp_bundle_config

=head1 AUTHOR

  Florian Ragwitz <rafl@debian.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Florian Ragwitz.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

