def word_count_top(text, take_amount)
  text = text.downcase.gsub(/[^a-za-яїі\s]/, '')
  words = text.split
  word_count = Hash.new(0)

  words.each do |word|
    word_count[word] += 1
  end

  if take_amount == 0 or take_amount < 0
    top_counted_words = word_count.sort_by { |word, count| -count }
  else
    top_counted_words = word_count.sort_by { |word, count| -count }.take(take_amount)
  end
  
  top_counted_words.map(&:first)
end

puts "Enter text: (or enter d! to use default text)"
text = gets

if text == "d!\n"
    text = "In a village of La Mancha, the name of which I have no desire to call to
    mind, there lived not long since one of those gentlemen that keep a lance
    in the lance-rack, an old buckler, a lean hack, and a greyhound for
    coursing. An olla of rather more beef than mutton, a salad on most
    nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
    on Sundays, made away with three-quarters of his income."
end

result = word_count_top(text, 3)

puts "\t\tTop 3:"

puts result


result = word_count_top(text, 0)

puts "\t\tTop All:"

puts result
