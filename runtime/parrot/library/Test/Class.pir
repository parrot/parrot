
=head1 NAME

Test::Class - Parrot extension for objecty testing of modules

=head1 SYNOPSIS

    .sub 'main'
        # load this library
        load_bytecode 'Test/Class.pbc'

        # load other testing libraries
        .include 'test_more.pir'

        .local pmc class
        class = subclass [ 'Test'; 'Class' ], 'MyClass'

        .local pmc obj
        obj = class.'new'()
        obj.'runtests'()
    .end

    .namespace [ 'MyClass' ]

    .sub 'init' :vtable :method
        self.'add_startup'(  'startup',  'tests' => 1 )
        self.'add_shutdown'( 'shutdown', 'tests' => 1 )
        self.'add_setup'(    'setup',    'tests' => 2 )
        self.'add_teardown'( 'teardown', 'tests' => 1 )
        self.'add_test'(     'test_foo', 'tests' => 3 )
        self.'add_test'(     'test_bar', 'tests' => 2 )
    .end

=head1 DESCRIPTION

C<Test::Class> is a pure-Parrot library for testing code in a class-y fashion.
It allows you to group test code in methods and use other object oriented
programming principles to organize and reuse code.

Most of your tests will occur within test methods; C<Test::Class> runs these
automatically for you.

THIS INTERFACE MAY CHANGE IN THE NEAR FUTURE.

For each test method, you must call C<add_test()>, passing the name of the test
method.  You may optionally pass the named parameter C<tests> with the number
of test assertions in the method.  You may have as many test methods as you
like.

C<Test::Class> can also run methods at the start of the testing process and
after all tests have ended.  These are startup and shutdown tests,
respectively.  Call C<add_startup()> and C<add_shutdown()> tests to add each
type of test.  Again, you may have as many of these methods as you like.

Finally, C<Test::Class> can run setup and teardown methods before and after
I<each> individual test method.  Call C<add_setup()> and C<add_teardown()>
respectively.

When you have finished adding tests, call the C<runtests()> method to run
everything.

=cut

.namespace [ 'Test'; 'Class' ]

.include 'load_bytecode.pir'

.sub '__init__' :tag('load')
    '__load_bytecode'('Test/More.pbc')

    .local pmc class
    class = newclass [ 'Test'; 'Class' ]

    addattribute class, 'test_count'
    addattribute class, 'setup_test_count'
    addattribute class, 'teardown_test_count'

    addattribute class, 'startup'
    addattribute class, 'setup'
    addattribute class, 'tests'
    addattribute class, 'teardown'
    addattribute class, 'shutdown'
    addattribute class, 'builder'
.end

.sub 'init' :vtable :method
    .local pmc rsa

    rsa = new 'ResizableStringArray'
    setattribute self, 'startup', rsa

    rsa = new 'ResizableStringArray'
    setattribute self, 'setup', rsa

    rsa = new 'ResizableStringArray'
    setattribute self, 'tests', rsa

    rsa = new 'ResizableStringArray'
    setattribute self, 'teardown', rsa

    rsa = new 'ResizableStringArray'
    setattribute self, 'shutdown', rsa

    .local pmc count
    count = new 'Integer'
    setattribute self, 'test_count', count

    count = new 'Integer'
    setattribute self, 'setup_test_count', count

    count = new 'Integer'
    setattribute self, 'teardown_test_count', count

    .local pmc tb
    tb = new [ 'Test'; 'Builder' ]
    setattribute self, 'builder', tb
.end

.sub 'add_startup' :method
    .param string meth_name
    .param int    tests      :optional :named('tests')
    .param int    have_tests :opt_flag

    .local pmc startup
    startup = getattribute self, 'startup'
    push startup, meth_name

  unless have_tests goto done
    self.'add_test_count'( tests )

  done:
    .return()
.end

.sub 'add_setup' :method
    .param string meth_name
    .param int    tests      :optional :named('tests')
    .param int    have_tests :opt_flag

    .local pmc setup
    setup = getattribute self, 'setup'
    push setup, meth_name

  unless have_tests goto done
    .local pmc setup_test_count
    setup_test_count  = getattribute self, 'setup_test_count'
    setup_test_count += tests

  done:
    .return()
.end

.sub 'add_test' :method
    .param string meth_name
    .param int    test_count :optional :named('tests')
    .param int    have_count :opt_flag

    .local pmc tests
    tests = getattribute self, 'tests'
    push tests, meth_name

  unless have_count goto done
    self.'add_test_count'( test_count )

  done:
    .return()
.end

.sub 'add_teardown' :method
    .param string meth_name
    .param int    tests      :optional :named('tests')
    .param int    have_tests :opt_flag

    .local pmc teardown
    teardown = getattribute self, 'teardown'
    push teardown, meth_name

  unless have_tests goto done
    .local pmc teardown_test_count
    teardown_test_count  = getattribute self, 'teardown_test_count'
    teardown_test_count += tests

  done:
    .return()
.end

.sub 'add_shutdown' :method
    .param string meth_name
    .param int    tests      :optional :named('tests')
    .param int    have_tests :opt_flag

    .local pmc shutdown
    shutdown = getattribute self, 'shutdown'
    push shutdown, meth_name

  unless have_tests goto done
    self.'add_test_count'( tests )

  done:
    .return()
.end

.sub 'add_test_count' :method
    .param int count

    .local pmc test_count
    test_count  = getattribute self, 'test_count'
    test_count += count

    .return()
.end

.sub 'runtests' :method
    .local pmc tb
    tb = getattribute self, 'builder'

    .local pmc count
    count = getattribute self, 'test_count'
    $I0   = count

    if $I0 goto set_int_count
    tb.'plan'( 'no_plan' )
    goto run_tests

  set_int_count:
    .local int int_count
    int_count = count

    .local pmc tests
    tests = getattribute self, 'tests'

    .local int num_test_methods
    num_test_methods = tests

    .local pmc wrap_count
    wrap_count = getattribute self, 'setup_test_count'
    $I0        = wrap_count
    $I0       *= num_test_methods
    int_count += $I0

    wrap_count = getattribute self, 'teardown_test_count'
    $I0        = wrap_count
    $I0       *= num_test_methods
    int_count += $I0

    tb.'plan'( int_count )

  run_tests:
    self.'loop_over_methods'( 'startup' )
    self.'loop_over_tests'()
    self.'loop_over_methods'( 'shutdown' )

    tb.'finish'()
.end

.sub 'loop_over_methods' :method
    .param string name

    .local pmc attribute
    attribute = getattribute self, name

    .local pmc it
    it = iter attribute

    .local string meth_name
  iter_loop:
    unless it goto loop_end
    meth_name = shift it
    self.meth_name()
    goto iter_loop
  loop_end:

    .return()
.end

.sub 'loop_over_tests' :method
    .local pmc tests
    tests = getattribute self, 'tests'

    .local pmc it
    it = iter tests

    .local string meth_name
  iter_loop:
    unless it goto loop_end
    self.'loop_over_methods'( 'setup' )
    meth_name = shift it
    self.meth_name()
    self.'loop_over_methods'( 'teardown' )
    goto iter_loop
  loop_end:

    .return()
.end

=head1 AUTHOR

Written and maintained by chromatic, C<< chromatic at wgz dot org >>, based on
Test::Class in Perl 5, L<http://search.cpan.org/perldoc?Test::Class>, written
by Adrian Howard.  Please send patches, feedback, and suggestions to the Perl 6
internals mailing list.

=head1 COPYRIGHT

Copyright (C) 2008, Parrot Foundation.


=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:

