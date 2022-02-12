#!/usr/bin/perl
#use warnings;

#open file and output error
my $phones = "phones.txt";
open my $phoneHandler, '<', $phones
    or die "Can not open phones.txt: $_";


#Promt user to input name
print("Please enter a first, last, or whole of someone's name: ");
$name = <>;

#format input
chomp($name);#remove newline character
$name = lc $name;  #all lowecase

#initilize variables
my $found = 0; #num of entries found
my $first_name; #first name in book
my $last_name; #last name in book

#for every line in phone book check if first two entries match the given name
while(<$phoneHandler>){
    my @phoneRow = split(/ /, $_); #splits row by white space
 
    $first_name = lc @phoneRow[0]; #the first word of the row, all lowecase
    $last_name = lc @phoneRow[1]; #the second word of the row, all lowecase
    
    #checks if the first or last names match the input
    if((index($first_name, $name) != -1) || (index($last_name, $name) != -1)){
        $found +=1;
        print($_);#print the name found
    }
}

#if no name is found then say so
if ($found == 0){
    print("no matches found");
}
