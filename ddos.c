#include <stdio.h>
#include <sys/socket.h>
#include <netdb.h>

//refactor into  a DDOS attack script

int main(int argc, char *argv[]) {
	int mysocket;
	int ct;

	int port;
	int init = 0;
	int fin = 65535;
	char *dest;
	dest = argv[1];
	
	struct sockaddr_in target;

	for(port==init;port<fin;port++)
	{	
		mysocket = socket(AF_INET, SOCK_STREAM, 0);
		target.sin_family = AF_INET;
		target.sin_port = htons(port);
		target.sin_addr.s_addr = inet_addr(dest);
	
		ct = connect(mysocket, (struct sockaddr *)&target, sizeof target);
	
		if(ct == 0)
		{
			printf("Port %d status --> [OPEN] \n", port);	
			close(mysocket);
			close(ct);
		} else {
			printf("Port %d status --> [CLOSED] \n", port);
			close(mysocket);
			close(ct);
		}
	}
}
