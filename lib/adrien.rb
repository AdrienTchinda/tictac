arrays = [1,2,3,4,5,6,7,8,9,10,11,12,13]

print arrays.count {|array| array%2 == 0 || array%3 == 0}