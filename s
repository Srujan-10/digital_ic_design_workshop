#!/usr/bin/tclsh
set n 7

# Upper part of the diamond
for {set i 0} {$i < $n} {incr i} {
    # Print spaces
    for {set j 0} {$j < [expr {$n - $i - 1}]} {incr j} {
        puts -nonewline " "
    }
    # Print stars
    for {set j 0} {$j <= [expr {2 * $i}]} {incr j} {
        puts -nonewline "*"
    }
    puts "" ;# Newline after each row
}

# Lower part of the diamond
for {set i [expr {$n - 2}]} {$i >= 0} {incr i -1} {
    # Print spaces
    for {set j 0} {$j < [expr {$n - $i - 1}]} {incr j} {
        puts -nonewline " "
    }
    # Print stars
    for {set j 0} {$j <= [expr {2 * $i}]} {incr j} {
        puts -nonewline "*"
    }
    puts "" ;# Newline after each row
}
