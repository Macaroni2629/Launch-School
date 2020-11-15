# Neutralizer
# We wrote a neutralize method that removes negative words from sentences. However, it fails to remove all of them. What exactly happens?

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

def neutralize(sentence)
  words = sentence.split(' ')
  word_clone = words.clone
  word_clone.each do |word|
    words.delete(word) if negative?(word)
  end

  words.join(' ')
end



puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

Approach/Algorithm
A good way to see what is happening is to inspect word and words for each iteration of the block on lines 3-5. In the following example we decided to simply insert a few print statements. We also use Enumerable#each_with_index instead of each, in order to see which index of the words array we are at.

Copy Code
def neutralize(sentence)
  words = sentence.split(' ')
  words.each_with_index do |word, index|
    p index
    p word
    p words
    words.delete(word) if negative?(word)
    p words
  end

  words.join(' ')
end
The output for the first three iterations looks like this:

Copy Code
0
"These"
["These", "dull", "boring", "cards", "are", "part", "of", "a", "chaotic", "board", "game."]
["These", "dull", "boring", "cards", "are", "part", "of", "a", "chaotic", "board", "game."]
1
"dull"
["These", "dull", "boring", "cards", "are", "part", "of", "a", "chaotic", "board", "game."]
["These", "boring", "cards", "are", "part", "of", "a", "chaotic", "board", "game."]
2
"cards"
["These", "boring", "cards", "are", "part", "of", "a", "chaotic", "board", "game."]
["These", "boring", "cards", "are", "part", "of", "a", "chaotic", "board", "game."]

At index 0, nothing interesting happens. When the iteration is at index 1, the element is "dull". Since it counts as negative, it is deleted from the array. As a consequence, each subsequent word is shifted one position to the left. In particular, the word that was previously at position 2, "boring", is now at position 1. So in the next step, when the iteration is at index 2, it finds "cards". Our mutation of the array caused it to skip "boring".

Solution
Copy Code
def neutralize(sentence)
  words = sentence.split(' ')
  words.reject! { |word| negative?(word) }
  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
#=> These cards are part of a board game.
Discussion
While iterating over an array, avoid mutating it from within the block. Instead you can use the Array methods select or reject/reject!.

Further Exploration
Note that we use reject! here, which does mutate the array while iterating over it. But the way reject! is implemented, it takes special care to avoid the problem we had in our code. We could re-implement it in Ruby as follows:

Copy Code
def mutating_reject(array)
  i = 0
  loop do
    break if i == array.length

    if yield(array[i]) # if array[i] meets the condition checked by the block
      array.delete_at(i)
    else
      i += 1
    end
  end

  array
end
For now, just read if yield(array[i]) as "if array[i] meets the condition checked by the block"; you will learn about using blocks in methods in course RB130. The important point is that i is not increased when the condition is met and the element is removed. This prevents the loop from skipping over elements like what happened in our case.

