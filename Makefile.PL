
use strict;
use warnings;

 BEGIN { require 5.006; } 

use ExtUtils::MakeMaker 6.11;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'App::Benchmark::Accessors',
                       'DISTNAME' => 'App-Benchmark-Accessors',
                       'CONFIGURE_REQUIRES' => {
                                                 'ExtUtils::MakeMaker' => '6.11'
                                               },
                       'AUTHOR' => 'Marcel Gruenauer <marcel@cpan.org>',
                       'BUILD_REQUIRES' => {},
                       'ABSTRACT' => 'Benchmark accessor generators',
                       'EXE_FILES' => [],
                       'VERSION' => '1.100870',
                       'PREREQ_PM' => {
                                        'Scalar::Util' => '0',
                                        'Rose::Object::MakeMethods::Generic' => '0',
                                        'Class::Accessor::Fast::XS' => '0',
                                        'Class::Accessor::Fast' => '0',
                                        'Class::Spiffy' => '0',
                                        'Class::Accessor::Classy' => '0',
                                        'Class::Accessor::Constructor' => '0',
                                        'File::Find' => '0',
                                        'Mouse' => '0',
                                        'Class::XSAccessor::Array' => '0',
                                        'Moose' => '0',
                                        'Class::Accessor::Complex' => '0',
                                        'Class::MethodMaker' => '0',
                                        'English' => '0',
                                        'Rose::Object' => '0',
                                        'parent' => '0',
                                        'Spiffy' => '0',
                                        'Class::Accessor' => '0',
                                        'Object::Tiny' => '0',
                                        'Mojo::Base' => '0',
                                        'Class::XSAccessor' => '0',
                                        'Carp' => '0',
                                        'Test::More' => '0.88',
                                        'File::Temp' => '0',
                                        'Rubyish::Attribute' => '0',
                                        'App::Benchmark' => '0',
                                        'accessors' => '0'
                                      },
                       'LICENSE' => 'perl'
                     );


delete $WriteMakefileArgs{LICENSE}
  unless eval { ExtUtils::MakeMaker->VERSION(6.31) };

WriteMakefile(%WriteMakefileArgs);



