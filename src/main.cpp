#include <iostream>
#include "Matrix.h"

int main() {
    std::cout << "Hello, Matrix!" << std::endl;

    Matrix<3, 4, double> a;
    Matrix<4, 5, double> b;
    auto x = a[1, 0];

    std::cout << a[1, 0] << std::endl;

    return 0;
}
