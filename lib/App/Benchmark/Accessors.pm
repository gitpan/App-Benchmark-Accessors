use 5.006;
use strict;
use warnings;

package App::Benchmark::Accessors;
our $VERSION = '1.100870';
# ABSTRACT: Benchmark accessor generators

#<<<
package    # hide from PAUSE
  WithMoose;
our $VERSION = '1.100870';
use Moose;
has myattr => ( is => 'rw' );

package    # hide from PAUSE
  WithMooseImmutable;
our $VERSION = '1.100870';
use Moose;
has myattr => ( is => 'rw' );
__PACKAGE__->meta->make_immutable;

package    # hide from PAUSE
  WithMouse;
our $VERSION = '1.100870';
use Mouse;
has myattr => ( is => 'rw' );

package    # hide from PAUSE
  WithMouseImmutable;
our $VERSION = '1.100870';
use Mouse;
has myattr => ( is => 'rw' );
__PACKAGE__->meta->make_immutable;

package    # hide from PAUSE
  WithClassAccessor;
our $VERSION = '1.100870';
use parent qw(Class::Accessor);
__PACKAGE__->mk_accessors(qw/myattr/);

package    # hide from PAUSE
  WithClassAccessorFast;
our $VERSION = '1.100870';
use parent qw(Class::Accessor::Fast);
__PACKAGE__->mk_accessors(qw/myattr/);

package    # hide from PAUSE
  WithClassAccessorFastXS;
our $VERSION = '1.100870';
use parent qw(Class::Accessor::Fast::XS);
__PACKAGE__->mk_accessors(qw/myattr/);

package    # hide from PAUSE
  WithClassAccessorComplex;
our $VERSION = '1.100870';
use parent qw(Class::Accessor::Complex);
__PACKAGE__->mk_new->mk_scalar_accessors(qw/myattr/);

package    # hide from PAUSE
  WithClassAccessorConstructor;
our $VERSION = '1.100870';
use parent qw(Class::Accessor::Constructor Class::Accessor::Complex);
__PACKAGE__->mk_constructor->mk_scalar_accessors(qw/myattr/);

package    # hide from PAUSE
  WithClassAccessorClassy;
our $VERSION = '1.100870';
use Class::Accessor::Classy;
with 'new';
rw 'myattr';
no  Class::Accessor::Classy;

package    # hide from PAUSE
  WithMojo;
our $VERSION = '1.100870';
use parent qw(Mojo::Base);
__PACKAGE__->attr('myattr');

package    # hide from PAUSE
  WithClassMethodMaker;
our $VERSION = '1.100870';
use Class::MethodMaker
    [ scalar => [ qw/myattr/ ],
      new    => [ qw/-hash new/ ],
    ];

package    # hide from PAUSE
  WithObjectTiny;
our $VERSION = '1.100870';
use Object::Tiny qw/myattr/;

package    # hide from PAUSE
  WithSpiffy;
our $VERSION = '1.100870';
use Spiffy -base;
field 'myattr';

package    # hide from PAUSE
  WithClassSpiffy;
our $VERSION = '1.100870';
use Class::Spiffy -base;
field 'myattr';

package    # hide from PAUSE
  WithAccessors;
our $VERSION = '1.100870';
use accessors qw(myattr);
sub new { bless {}, shift }

package    # hide from PAUSE
  WithClassXSAccessor;
our $VERSION = '1.100870';
use Class::XSAccessor accessors => { myattr => 'myattr' };
sub new {
    my $class = shift;
    bless { @_ } => $class;
}

package    # hide from PAUSE
  WithClassXSAccessorArray;
our $VERSION = '1.100870';
use Class::XSAccessor::Array accessors => { myattr => 0 };
sub new {
    my $class = shift;
    my %args = @_;
    bless [ $args{myattr} ] => $class;
}

package    # hide from PAUSE
  WithObjectTinyXS;
our $VERSION = '1.100870';
use Object::Tiny qw/myattr/;
use Class::XSAccessor accessors => { myattr => 'myattr' }, replace => 1;

package    # hide from PAUSE
  WithRose;
our $VERSION = '1.100870';
use parent qw(Rose::Object);
use Rose::Object::MakeMethods::Generic(scalar => 'myattr');

#package    # hide from PAUSE
#  WithBadgerClass;
#use Badger::Class
#    base     => 'Badger::Base',
#    mutators => 'myattr';

package    # hide from PAUSE
  WithRubyishAttribute;
our $VERSION = '1.100870';
use Rubyish::Attribute;
sub new { bless {}, shift }

attr_accessor "myattr";
#>>>
1;


__END__
=pod

=head1 NAME

App::Benchmark::Accessors - Benchmark accessor generators

=head1 VERSION

version 1.100870

=head1 DESCRIPTION

This distribution runs benchmarks on various accessor generators. The
following generators are being benchmarked:

=over 4

=item Moose

=item Mouse

=item Class::Accessor

=item Class::Accessor::Fast

=item Class::Accessor::Fast::XS

=item Class::Accessor::Complex

=item Class::Accessor::Constructor

=item Mojo::Base

=item Class::MethodMaker

=item Object::Tiny

=item Spiffy

=item Class::Spiffy

=item C<accessors>

=item Class::XSAccessor

=item Class::XSAccessor::Array

=back

The benchmarks are being run as part of the test suite; see L<App::Benchmark>.
This way you can look at this distribution's CPAN testers page to see the
benchmark results on many different platforms and for many different perl
versions.

The C<t/construction.t> file benchmarks object creation, C<t/get.t> benchmarks
getter methods and C<t/set.t> benchmarks setter methods.

Not every benchmark is run on every module; for example, L<Object::Tiny>
doesn't create setter methods, and L<accessors> doesn't generate constructors.

Each benchmark test file takes an optional numeric parameter that is used as
the number of iterations.

It's probably a good idea not to read too much into these benchmarks; they
could be seen as micro-optimization. However, if you have a complex object
hierarchy and create lots of objects and run many many getters/setters on
them, they could help to save some time. But be sure to use L<Devel::NYTProf>
first to see where your real bottlenecks are.

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests through the web interface at
L<http://rt.cpan.org/Public/Dist/Display.html?Name=App-Benchmark-Accessors>.

=head1 AVAILABILITY

The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit L<http://www.perl.com/CPAN/> to find a CPAN
site near you, or see
L<http://search.cpan.org/dist/App-Benchmark-Accessors/>.

The development version lives at
L<http://github.com/hanekomu/App-Benchmark-Accessors/>.
Instead of sending patches, please fork this project using the standard git
and github infrastructure.

=head1 AUTHOR

  Marcel Gruenauer <marcel@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2008 by Marcel Gruenauer.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

