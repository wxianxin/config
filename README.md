My configurations.
Don't foget the hidden files.


################################################################################
# indexing, slicing and iterating
a[ : :-1]
# When fewer indices are provided than the number of axes, the missing indices are considered complete slices.
# The expression within brackets in b[i] is treated as an i followed by as many instances of : as needed to represent the remaining axes. NumPy also allows you to write this using dots as b[i,...].
# The dots (...) represent as many colons as needed to produce a complete indexing tuple.
x[4,...,5,:]

# Iterating over multidimensional arrays is done with respect to the first axis
for row in b:
	print(row)
# if one wants to perform an operation on each element in the array, one can use the flat attribute which is an iterator over all the elements of the array
for element in b.flat:
	print(element)

################################################################################
# Shape Manipulation
a.ravel()  # returns the array, flattened
# The order of the elements in the array resulting from ravel() is normally “C-style”, that is, the rightmost index “changes the fastest”, so the element after a[0,0] is a[0,1]. If the array is reshaped to some other shape, again the array is treated as “C-style”.
a.reshape(6,2)  # returns the array with a modified shape
a.reshape(3,-1) # If a dimension is given as -1 in a reshaping operation, the other dimensions are automatically calculated.
a.T  # returns the array, transposed

################################################################################
# Stacking together different arrays/Splitting one array into several smaller ones
np.vstack((a,b))
np.hstack((a,b))
# For arrays of with more than two dimensions, '-----------' stacks along their second axes, 'vstack' stacks along their first axes, and 'concatenate' allows for an optional arguments giving the number of the axis along which the concatenation should happen.

np.hsplit(a,3)   # Split a into 3
np.hsplit(a,(3,4))   # Split a after the third and the fourth column
np.vsplit() # splits along the vertical axis, and 
np.array_split() # allows one to specify along which axis to split.

################################################################################
# Copies and Views
# Simple assignments make no copy of array objects or of their data.
a = np.arange(12)
b = a
b is a

# Python passes mutable objects as references, so function calls make no copy.
id(x) # id is a unique identifier of an object

# Different array objects can share the same data. The 'view' method creates a new array object that looks at the same data.
c = a.view()
c is a 			# False
c.base is a 	# True
c.flags.owndata	# False
c.shape = 2,6	# a's shape doesn't change
c[0,4] = 1234   # a's data changes

# Slicing an array returns a view of it.


# The copy method makes a complete copy of the array and its data.
d = a.copy()	# a new array object with new data is created
d is a 			# False
d.base is a 	# False

################################################################################
# Broadcasting rules
# 1. If all input arrays do not have the same number of dimensions, a “1” will be repeatedly prepended to the shapes of the smaller arrays until all the arrays have the same number of dimensions.
# 2. Arrays with a size of 1 along a particular dimension act as if they had the size of the array with the largest shape along that dimension. The value of the array element is assumed to be the same along that dimension for the “broadcast” array.


################################################################################
np.ix_(*args) # Construct an open mesh from multiple sequences.
# This function takes N 1-D sequences and returns N outputs with N dimensions each, such that the shape is 1 in all but one dimension and the dimension with the non-unit shape value cycles through all N dimensions.


################################################################################
a.transpose()
u = np.eye(2)
np.dot (j, j) # matrix product
np.trace(u)   # trace
np.linalg.solve(a, y)	# Solve a linear matrix equation, or system of linear scalar equations.
np.linalg.eig(j)		# Compute the eigenvalues and right eigenvectors of a square array.
np.linalg.inv(a)		# Compute the (multiplicative) inverse of a matrix.

################################################################################
np.random.random()		# Return random floats in the half-open interval [0.0, 1.0).
np.random.rand()		# Random values in a given shape.
np.random.randn()		# Return a sample (or samples) from the “standard normal” distribution.

