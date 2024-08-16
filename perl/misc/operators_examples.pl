#!/usr/bin/perl -wl

# https://metacpan.org/pod/Modern::Perl
use v5.38;

my $addition = ( ( 3 + 2 ) * ( 5 - 3 ) / 2 );    # must be declared first
print "\nArithmetic Operators: $addition";

# print("$addition");

# scalar variable assignment and string concatenation
my $first_name = "Melanie";
my $last_name  = "Quigley";
my $salary     = 125000.00;
print "$first_name $last_name" . "\'s" . " salary is $salary";

# Todo: wrong formatting
printf( "Meet %s: Age %d: Salary %5d: \$10.2f\n", "John", 40, 55000 );

# Arrays or ordered list
my @names = ( "Eriberto", "Ronaldo", "Shadeed", "Raed", "Omar" );
print "Here\'s a list of names: @names";
print "First member is $names[0] while $names[-1] is the last.";

# add new element
@names[5] = "James";
print "Welcome aboard new member $names[-1] to the group: @names\n";

# Hash or unordered key/value pairs
my %employee = (
    "Name"     => "Eriberto Mendez Jr.",
    "Mobile"   => "(+966) 554081186",
    "Position" => "Lead Engineer",
);

#print $employee{"Name"}; # note the scalar context of hash variable
# add a K/V pair
$employee{"Iqama"} = "2388050672";

# print $employee{"Iqama"};
#print $employee{"Position"};
# alternative quoting aside from single/double quotes
# and heredoc aka here document (yes same as in shell)
print qq/Hello there $employee{"Name"} Your ID $employee{"Iqama"} and title
$employee{"Position"} are amazing!/;
my @days = qw( Mon Tue Wed Thu Fri Sat Sun );
print "Days of the week: @days";
print "Weekends begin $days[5] and ends $days[-1]";
my $today = qx(date);    # same as $today = `date`
print "Date: $today"
