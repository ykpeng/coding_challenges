#include <iostream>
#include <string>
#include <curl/curl.h>
#include <thread>
#include <vector>
#include "CurlWrapper.h"
#include <mutex>

// This is just checking that your compiler can handle this syntax (some compilers get confused by the ">>")
std::vector<std::vector<int>> syntax_test_vector;

void crawl_url(std::string uri) {
    CurlResult result = CurlWrapper::request(uri);

    std::cout << result.response_body << std::endl;
}

int main()
{
    std::cout << "If this project compiles and runs, you're ready for the Triplebyte interview!" << std::endl;

    std::thread t (&crawl_url, "https://www.example.com");

    t.join();

    return 0;
}
