#!/usr/bin/env perl

use warnings;
use strict;
use App::Benchmark ':all';
use App::Benchmark::Accessors;

my $iterations = shift;
$iterations ||= 2_000_000;

my $Moose                    = WithMoose->new;
my $MooseImmutable           = WithMooseImmutable->new;
my $Mouse                    = WithMouse->new;
my $ClassAccessor            = WithClassAccessor->new;
my $ClassAccessorFast        = WithClassAccessorFast->new;
my $ClassAccessorFastXS      = WithClassAccessorFastXS->new;
my $ClassAccessorComplex     = WithClassAccessorComplex->new;
my $ClassAccessorConstructor = WithClassAccessorConstructor->new;
my $Mojo                     = WithMojo->new;
my $ClassMethodMaker         = WithClassMethodMaker->new;
my $Accessors                = WithAccessors->new;
my $ObjectTiny               = WithObjectTiny->new;
my $Spiffy                   = WithSpiffy->new;
my $ClassSpiffy              = WithClassSpiffy->new;

benchmark_diag($iterations, {
    moose =>
        sub { $Moose->myattr },
    moose_immutable =>
        sub { $MooseImmutable->myattr },
    mouse =>
        sub { $Mouse->myattr },
    class_accessor =>
        sub { $ClassAccessor->myattr },
    class_accessor_fast =>
        sub { $ClassAccessorFast->myattr },
    class_accessor_fast_xs =>
        sub { $ClassAccessorFastXS->myattr },
    class_accessor_complex =>
        sub { $ClassAccessorComplex->myattr },
    class_accessor_constructor =>
        sub { $ClassAccessorConstructor->myattr },
    mojo =>
        sub { $Mojo->myattr },
    class_methodmaker =>
        sub { $ClassMethodMaker->myattr },
    object_tiny =>
        sub { $ObjectTiny->myattr },
    accessors =>
        sub { $Accessors->myattr },
    spiffy =>
        sub { $Spiffy->myattr },
    class_spiffy =>
        sub { $ClassSpiffy->myattr },
});

