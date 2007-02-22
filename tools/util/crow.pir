#! ./parrot
# run this from parrot root dir (for now)

.include 'hllmacros.pir'


.sub 'main' :main
    load_bytecode 'Crow.pir' # TODO s/pir/pbc/

    .local pmc _
    .IMPORT( ['Crow::Utils'], 'merge_data', _ )

    $S0 = 'template'()

    $P0 = 'data'()
    $S1 = merge_data($S0,$P0)
    print $S1
.end


.sub 'data'
    $P0 = new .Hash
    $P0['Parrot.version']    = '0.4.9'
    $P0['Parrot.name']       = 'Socorro'
    $P0['Parrot.web.root']   = 'http://parrotcode.org'
    $P0['Parrot.web.source'] = 'http://parrotcode.org/source'
    $P0['Release.Date']              = '22 February 2007'
    $P0['Release.NextScheduledDate'] = 'xx March 2007'

    # TODO get data from NEWS
    .return ($P0)
.end


.sub 'template'
# TODO make this the release template
    $S0 = <<'EOT'
On behalf of the Parrot team, I'm proud to announce Parrot @Parrot.version@
"@Parrot.name@." Parrot (@Parrot.web.root@) is a virtual machine aimed
at running all dynamic languages.

Parrot @Parrot.version@ can be obtained via CPAN (soon), or follow the
download instructions at @Parrot.web.source@.
For those who would like to develop on Parrot, or help develop
Parrot itself, we recommend using Subversion or SVK on the
source code repository to get the latest and best Parrot code.

Parrot @Parrot.version@ News:
@NEWS@

Thanks to all our contributors for making this possible, and our
sponsors for supporting this project.

Enjoy!

EOT
    .return ($S0)
.end

