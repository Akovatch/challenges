# Simple Linked List

# Write a simple linked list implementation. The linked list is a fundamental data
# structure in computer science, often used in the implementation of other data structures.

# The simplest kind of linked list is a singly linked list. Each element in the list
# contains data and a "next" field pointing to the next element in the list of elements.
# This variant of linked lists is often used to represent sequences or push-down stacks
# (also called a LIFO stack; Last In, First Out).

# Let's create a singly linked list whose elements may contain a range of data such as
# the numbers 1-10. Provide functions to reverse the linked list and convert a linked
# list to and from an array.

# REQUIRED:
  # Element class with contructor that accepts two arguments (number and next element)
  # Element#datum method that returns element value?
  # Element#tail? methos that ???
  # Element#next method that will return the next element??? (or nil)
  # note: it appears each element keeps track of the next element in the list?

  # SimpleLinkedList class
  # SLL#size - returns size
  # SLL#empty? - boolean
  # SLL#push - pushes element into collection
  # SLL#peek - retrieves that last element? first???
  # SLL#head - returns first element in list
  # SLL#pop - removes and returns last item of list
  # SLL#reverse

  # SLL::from_a - converts an array argument into a list object, returns a new SLL list object

class Element
  def initialize(value, next_element)
    @value = value
    @next_element = next_element
  end

  def datum
    @value
  end

  def tail?
    # ???
  end

  def next
      # Element#next method that will return the next element??? (or nil)
  end
end