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

# Hash mapping each alphabet letter to its T9 correspondence
my $t9_map = {
  'A' => 2,
  'B' => 2,
  'C' => 2,
  'D' => 3,
  'E' => 3,
  'F' => 3,
  'G' => 4,
  'H' => 4,
  'I' => 4,
  'J' => 5,
  'K' => 5,
  'L' => 5,
  'M' => 6,
  'N' => 6,
  'O' => 6,
  'P' => 7,
  'Q' => 7,
  'R' => 7,
  'S' => 7,
  'T' => 8,
  'U' => 8,
  'V' => 8,
  'W' => 9,
  'X' => 9,
  'Y' => 9,
  'Z' => 9,
};

################################################################################
# Helper functions
################################################################################

# word2t9
#
# Convert a word to a T9 representation
# Params:
#   $word: the word to convert to T9
#   \%t9_map: the letter to digit map
#
# Returns: the sequence of numbers that represent the input word in T9
#
sub word2t9 {
  my ($word, $t9_map) = @_;

  my $t9_word = "";
  for (my $c = 0; $c < length ($word); $c++) {
    $t9_word .= $t9_map->{substr ($word, $c, 1)};
  }

  return $t9_word;
}

# make_t9_dict
#
# Convert each dictionary words to its T9 representation
# 
# Parameters
#   \@words: reference toa
#   \%t9_map: the letter to digit map
#
# Returns: reference to a hash containing the digits sequences as keys
#          and a reference to an array with the possible words formed from that 
#          sequence
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

# read_peopl
#
# Read a phonebook composed of people names and their phone
# 
# Parameters:
#   $filename: phonebook filename
# 
# Returns: a hash containing the names in the keys and the phone in the values
#
sub read_phonebook {
  my ($filename) = shift;

  # TODO: stub
  {
    "john" => 2255,
    "mary" => 3389,
    "john due" => 28
  }
}

# read_dict
# 
# Reads a list of words separated by blanks from a file
#
# Returns: reference to array containing the words
#
sub read_dict {
  my $file = shift;

}

# phone_words
#
# Returns a hash containing the people's name as keys and possible
# words formed from their phone number
#
# Parameters:
#   \%people: reference to a hash with people's names as keys and phones as values
#   \%dict: reference to the t9 dictionary, as returned by make_t9_dict
#
# Returns: reference to hash containing people's names as keys and possible words
#          formed from their phones as values
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
my $people = read_phonebook;

use Data::Dumper;
my $a = phone_word ($people, $dict);
print Data::Dumper->Dump ([$a]);
