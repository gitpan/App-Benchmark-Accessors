
use strict;
use warnings;

BEGIN { require 5.006; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Benchmark accessor generators',
  'AUTHOR' => 'Marcel Gruenauer <marcel@cpan.org>',
  'BUILD_REQUIRES' => {
    'App::Benchmark' => '0',
    'Carp' => '0',
    'English' => '0',
    'File::Find' => '0',
    'File::Temp' => '0',
    'Scalar::Util' => '0',
    'Test::More' => '0.94'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'App-Benchmark-Accessors',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'App::Benchmark::Accessors',
  'PREREQ_PM' => {
    'Class::Accessor' => '0',
    'Class::Accessor::Classy' => '0',
    'Class::Accessor::Complex' => '0',
    'Class::Accessor::Constructor' => '0',
    'Class::Accessor::Fast' => '0',
    'Class::Accessor::Fast::XS' => '0',
    'Class::MethodMaker' => '0',
    'Class::Spiffy' => '0',
    'Class::XSAccessor' => '0',
    'Class::XSAccessor::Array' => '0',
    'Mojo::Base' => '0',
    'Moose' => '0',
    'Mouse' => '0',
    'Object::Tiny' => '0',
    'Rose::Object' => '0',
    'Rose::Object::MakeMethods::Generic' => '0',
    'Rubyish::Attribute' => '0',
    'Spiffy' => '0',
    'accessors' => '0',
    'parent' => '0'
  },
  'VERSION' => '1.102310',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



