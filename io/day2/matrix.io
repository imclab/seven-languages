#! /usr/bin/io

# 5. Write a prototype for a two-dimensional list.  The dim(x,y) method should
# allocate a list of y lists that are x elements long. set(x,y,value) should set 
# a value, and get(x,y) should return that value.
TwoDimList := Object clone
TwoDimList dim := method(x,y,(
	self innerList := list()
	outer_i := 0
	for(outer_i,0,y-1,(
		self innerList append(list())
		inner_i := 0
		for(inner_i,0,x-1,(
			self innerList at(outer_i) append(0)
		))
	))	

	self innerList println
))
TwoDimList print := method (
	self innerList println
)
TwoDimList set := method(x,y,value,(
	self innerList at(y) atPut(x,value)
))
TwoDimList get := method(x,y,(
	return self innerList at(y) at(x)
))

TwoDimList transpose := method(
	new_matrix := TwoDimList clone

	num_lists := self innerList at(0) size
	list_size := self innerList size
	new_matrix dim(list_size, num_lists)

	outer_i := 0
	for(outer_i,0,num_lists-1,(
		inner_i := 0
		for(inner_i,0,list_size-1,(
			new_matrix set(self get(inner_i,outer_i))
		))
	))

	return new_matrix
)

exampleList := TwoDimList clone
exampleList dim(5,3)
exampleList set(4,2,"happy")
exampleList get(4,2) println
exampleList get(3,2) println
exampleList print

newList := exampleList transpose()
exampleList print
newList print