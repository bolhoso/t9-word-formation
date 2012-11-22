#!/usr/bin/perl

################################################################################
# Every number in phone has some corresponding digits.
# Imagine you have a list of users and you´d like to make
# a fancy feature that show possible words to form from their
# phone number and print all the possibilities.
# You can assume that a word is formed from the full phone
#
# Code a method called phone_word that receives the user phone
# as the input and return an array with all possible words from
# a dictionary.
#
# Start: 21:30
#
################################################################################

use strict;
use warnings;

my $t9_map = {
  'S' => 7,
  'F' => 3,
  'T' => 8,
  'N' => 6,
  'K' => 5,
  'Y' => 9,
  'E' => 3,
  'V' => 8,
  'Z' => 9,
  'Q' => 7,
  'M' => 6,
  'C' => 2,
  'L' => 5,
  'A' => 2,
  'J' => 5,
  'O' => 6,
  'W' => 9,
  'X' => 9,
  'P' => 7,
  'B' => 2,
  'H' => 4,
  'D' => 3,
  'R' => 7,
  'I' => 4,
  'G' => 4,
  'U' => 8
};

################################################################################
# Helper functions
################################################################################

# Convert a word to a T9 representation
sub word2t9 {
  my ($word, $t9_map) = @_;

  my $t9_word = "";
  for (my $c = 0; $c < length ($word); $c++) {
    $t9_word .= $t9_map->{substr ($word, $c, 1)};
  }

  return $t9_word;
}

# Read words from a dictionary and convert it to T9 format
# 
# Parameters
#   $t9_map:
#
sub make_t9_dict {
  my ($words, $t9_map) = @_;
  
  # TODO: convert to upper case using some fancy perl expression, like map
  ## $words[$i] = upper ($words[i]) foreach (@words);
  #

  # For each word, find the T9 equivalent and put into the hash, with the number as a kye
  # and the value the array of words corresponding to that key
  my $t9_hash = {};
  foreach my $word (@$words) {
    my $t9_word = word2t9($word, $t9_map);
    
    if (!defined $t9_hash->{$t9_word}) {
      $t9_hash->{$t9_word} = [$word];
    } else {
      push @{$t9_hash->{$t9_word}}, $word;
    }
  }

  return $t9_hash;
}

# Read a hash of people containing name and phone
sub read_people {
  # TODO: stub
  {
    "john" => 2255,
    "mary" => 3389,
    "john due" => 28
  }
}

sub read_dict {
  my $file = shift;

}

# phone_words
#
# Returns a hash containing the people's name as keys and possible
# words formed from their phone number
#

sub phone_word {
  my ($people, $dict) = @_;

  my $phone_words = {};
  foreach my $name (keys %$people) {
    my $phone = $people->{$name};
    $phone_words->{$name} = $dict->{$phone};
  }

  return $phone_words;
}

################################################################################
# The main routines
################################################################################

# The huge dictionary containing the words we know
my $words = [qw(BALL CAKL DOG CAT YELLOW BLUE SKY AND SO ON A LOT OF WORDS IN THIS GOD DAMN WORLD ABU)];
my $dict = make_t9_dict ($words, $t9_map);
my $people = read_people;

use Data::Dumper;
my $a = phone_word ($people, $dict);
print Data::Dumper->Dump ([$a]);
