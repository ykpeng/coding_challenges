# Given a singly linked list, write a function that will randomly return an element from this list. Every elem must have an equal probability of being returned. Best sol only runs through list once, and uses constant space.

# each link has a 1/length probability of being return. need to run through once to find length
# brute force: find length, rand(length), to go link
