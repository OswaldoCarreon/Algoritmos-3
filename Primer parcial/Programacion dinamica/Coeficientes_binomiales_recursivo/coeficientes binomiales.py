import pandas as pd
pascal = list()

def create_matrix(n):
	k = n+1

	for i in range(n):
		a = list()
		for i in range(k):
			a.append(0)
		pascal.append(a)

def print_piramide():
	print(pd.DataFrame(pascal))

def piramide(n,k):
	if k == 1 or k == n+1:
		pascal[n-1][k-1] = 1
		return 1
	
	else:
		p = piramide(n-1,k-1) + piramide(n-1,k)
		pascal[n-1][k-1] = p
		return p


n = 10
k = n+1
create_matrix(n)

for i in range(n+1,0,-1):
	pascal[n-1][i-1] = piramide(n,i)

print_piramide()





