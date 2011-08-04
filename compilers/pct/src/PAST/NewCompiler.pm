class PAST::NewCompiler is PAST::Compiler;

=NAME PAST::NewCompiler - PAST to newPOST Compiler

=begin DESCRIPTION
PAST::NewCompiler compiles PAST nodes to "newPOST"
for direct compilation to PBC.

This class mostly overrides as_post for specific
PAST nodes to generate the needed newPOST.

=end DESCRIPTION

has $!file;

=item super(method [, arg, ..., 'option'=>option, ...])
Calls a method on the superclass.

method super($method, *@args, *%opts) {
    pir::find_method__pps(PAST::Compiler, $method)(self, |@args, |%opts);
}


=item to_post(node [, 'option'=>option, ...])
Compile the abstract syntax tree given by C<past> into POST.

method to_post($past, *%options) {
    $!file := POST::File.new unless $!file;
    $!file.push(self.super('to_post', $past, |%options));
    $!file;
}

=item as_post(Any)
Delegate to POST::Compiler

multi method as_post($node, *%options) {
    self.super('as_post', $node, |%options);
}

=item as_post(Integer)
=item as_post(Float)
=item as_post(String)
Handle Integer, Float, and String nodes in the PAST tree, by
generating a constant.

multi method as_post(Integer $node, *%options) {
    self.coerce(POST::Constant.new(:type('ic'), :value($node)),
                %options<rtype>);
}

multi method as_post(Float $node, *%options) {
    self.coerce(POST::Constant.new(:type('nc'), :value($node)),
                %options<rtype>);
}

multi method as_post(String $node, *%options) {
    my $escaped := pir::escape__ss($node);
    my $encoding := pir::encodingname__si(pir::encoding__is($node));
    self.coerce(POST::String.new(:type('sc'), :value($escaped),
                                 :encoding($encoding),
                                 :charset('ascii')
                                ), %options<rtype>);
}

=item as_post(PAST::Block node)
Check for certain PIR flags, and attach it to the file

multi method as_post(PAST::Block $node, *%options) {
    my $post := self.super('as_post', $node, |%options);
    my $flags := $node.pirflags;
    $post.main(1) if pir::index($flags, ':main') >= 0; 
    $post.init(1) if pir::index($flags, ':init') >= 0;
    $post.load(1) if pir::index($flags, ':load') >= 0;
    $!file.push($post);

    return POST::Ops.new; # No-op
}

=begin head1
COPYRIGHT

Copyright (C) 2011, Parrot Foundation.

=end head1
