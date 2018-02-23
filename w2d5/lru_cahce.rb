

# Tonight we're going to implement a basic LRU Cache using an array. This will be a simple implementation that doesn't use a hash-map or linked list. We will assume our input is limited to Fixnums, Strings, Arrays, Symbols, and Hashes. We will allow the user to set the size of the cache.
#
# Ultimately, our LRU Cache should function as follows:
#
# johnny_cache = LRUCache.new(4)
#
#   johnny_cache.add("I walk the line")
#   johnny_cache.add(5)
#
#   johnny_cache.count # => returns 2
#
#   johnny_cache.add([1,2,3])
#   johnny_cache.add(5)
#   johnny_cache.add(-5)
#   johnny_cache.add({a: 1, b: 2, c: 3})
#   johnny_cache.add([1,2,3,4])
#   johnny_cache.add("I walk the line")
#   johnny_cache.add(:ring_of_fire)
#   johnny_cache.add("I walk the line")
#   johnny_cache.add({a: 1, b: 2, c: 3})
#
#
#   johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]







class LRUCache
  attr_reader :cache
   def initialize(cache = [], size)
     @cache = cache
     @size = size
   end

   def count
     puts size
     nil
     # returns number of elements currently in cache
   end

   def add(el)
     if cache.include?(el)
       cache.delete(el)
       cache << el
     elsif size == cache.length
       cache.unshift
       cache << el
     else
       cache << el
     end
     nil
     # adds element to cache according to LRU principle
   end

   def show
     puts cache
     nil
     # shows the items in the cache, with the LRU item first
   end

   private
   # helper methods go here!

 end
