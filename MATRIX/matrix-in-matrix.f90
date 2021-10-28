program array
REAL, allocatable :: a(:,:,:,:)
REAL, allocatable :: b(:,:)
allocate(b(20,10))
allocate(a(1,1,20,10))
b = 0
b(3,4) = b(3,4) + 1
a(1,1,:,:) = b
print *, size(a), a(1,1,3,4)


end
