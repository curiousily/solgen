#include <fcntl.h>
#include <iostream>
using namespace std;

int main() {
	#ifndef ONLINE_JUDGE
	  close (0); open("in.txt", O_RDONLY);
//	  close (1); open("out.txt", O_WRONLY | O_CREAT, 0600);
	#endif
	
	
	
	return 0;
}