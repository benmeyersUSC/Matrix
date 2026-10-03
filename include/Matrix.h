#pragma once
#include <cstddef>

template<size_t M, size_t N, typename T = double>
class Matrix {
    T values[M][N]{};
public:
    Matrix() = default;
    ~Matrix() = default;

    T operator[](size_t r, size_t c){
        return values[r][c];
    }

    template<size_t K>
    Matrix<M,K,T> operator* (const Matrix<N,K,T>& r){
        Matrix<M,K,T> out;
        return out;
    }
};
