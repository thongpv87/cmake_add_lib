#include <iostream>
#include "test.h"
#include "ares.h"
#include <string.h>

int main() {
    struct sockaddr_in sockaddr;
    std::cout << "add (2, 3) = " << add(2,3) << std::endl;
    std::cout << "test include ares.h ok " << ARES_OPT_HOSTS_FILE  << std::endl;
    //test c-ares lib
    char dst[10];
    memset(dst, 0, 10);
    ares_inet_pton(AF_INET, "192.168.1.10", dst);
    std::cout << "test ares_inet_pton";
    for (int i=0; i< 10; i++ )
             std::cout << int(dst[i]);
    return 0;
}
